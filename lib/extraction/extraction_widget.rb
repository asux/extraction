require 'qtuitools'
require 'main_window'

class Extraction::ExtractionWidget < Qt::MainWindow
  include UiMainWindow

  slots 'calculate()', 'show_coordinates(const &Qt::QPoint)', 'show_size(double)'

  def load_ui
    @ui_path = File.expand_path('../../ui/main_widget.ui', File.dirname(__FILE__))
    setup_ui(self)
  end

  def initialize(parent=nil)
    super
    load_ui
    #@central_widget = @tab_widget
    @deg_extract.maximum = Extraction::R_MAX
    connect @calc, SIGNAL('clicked()'), SLOT('calculate()')
    init_plot
    init_tracking
  end

  def init_tracking
    connect Extraction::MouseSpy.new(plot.canvas), SIGNAL("MouseMove"), SLOT('show_coordinates(const &Qt:QPoint)')
    @status_bar.show_message 'При передвижении указателя в статусе будут отображаться координаты'
    connect SIGNAL('resized()'), self, SLOT('show_size(double)')
  end

  def init_plot_items
    @plot.detach_items
    @grid = Qwt::PlotGrid.new
    @grid.enable_x_min(true)
    @grid.maj_pen = Qt::Pen.new(Qt::Brush.new(Qt::gray), 0, Qt::DotLine)
    @grid.min_pen = Qt::Pen.new(Qt::Brush.new(Qt::gray), 0, Qt::DotLine)
    @grid.attach(plot)
  end

  def init_plot
    @plot.title = 'Зависимость степени извлечения от кол-ва экстракций'
    #@plot.setCanvasBackground Qt::white
    @plot.setCanvasLineWidth 2
    @plot.plotLayout.canvasMargin = 0
    @plot.plotLayout.alignCanvasToScales = true
    @plot.setAxisTitle @plot.xBottom, 'количество экстракций, n'
    @plot.setAxisTitle @plot.yLeft, 'степень извлечения, R'
    @plot.setAxisAutoScale(@plot.xBottom)
    @plot.setAxisAutoScale(@plot.yLeft)
    @plot.setAxisScale(@plot.xBottom, 1, @max_iter.value)
    @plot.setAxisScale(@plot.yLeft, 0, Extraction::R_MAX)
    init_plot_items
  end

  def show_coordinates(position)
    @status_bar.show_message(printf('x = %+.6g, y = %+.6g', [@plot.invTransform(Qwt::Plot::xBottom, position.x), @plot.invTransform(Qwt::Plot::yLeft, position.y)]))
  end

  def show_size(size)
    @status_bar.show_message('resized')
  end

  def draw_plot(deg_ext)
    @status_bar.show_message('Построение графика')
    init_plot_items
    x = NArray.float((@max_iter.value - 1)/0.01).indgen * 0.01
    y = x.collect { |i| Extraction::R_MAX * Extraction::Calculations.degree_of_extraction(deg_ext, i) }
    dy = x.collect { |i| Extraction::R_MAX * Extraction::Calculations.derivative_of_de(deg_ext, i) }
    # graph
    @curve = Qwt::PlotCurve.new('график')
    @curve.setData(x, y)
    @pen = Qt::Pen.new(Qt::Color.new(Qt::black))
    @pen.width = 1
    @curve.setPen(pen)
    @curve.setRenderHint(Qwt::plotItem.renderAntialiased);
    @curve.attach(plot)
    # derivative
    @curve_deriv = Qwt::plotCurve('производная')
    @curve_deriv.setData(x, dy)
    @pen_deriv = Qt::Pen(Qt::Color.new(Qt::red))
    @pen_deriv.width = 1
    @curve_deriv.pen = @pen_deriv
    @curve_deriv.setRenderHint(Qwt.plotItem.renderAntcaliased);
    @curve_deriv.attach(@plot)
    # axis
    @plot.setAxisScale(@plot.xBottom, 1, max_iter.value)
    @plot.setAxisScale(@plot.yLeft, deg_ext, 1)
    @plot.setAxisAutoScale(@plot.yLeft)
    @plot.replot
    @status_bar.show_message('График создан')
  end

  def calculate
    coef_ex = @coef_extract.value
    vol_w = @vol_whater.value
    vol_o = @vol_organic.value
    deg_ext = coef_ex / (coef_ex + vol_w / vol_o)
    @deg_extract.value = 100.0 * deg_ext
    draw_plot(deg_ext) if(deg_ext > 0)
  end
end
