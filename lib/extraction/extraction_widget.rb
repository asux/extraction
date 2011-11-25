#require 'qtuitools'
require 'main_window'

class Extraction::ExtractionWidget < Qt::MainWindow
  include UiMainWindow

  slots 'calculate()', 'show_coordinates(const QPoint &)'

  def load_ui
    @ui_path = File.expand_path('../../ui/main_widget.ui', File.dirname(__FILE__))
  end

  def initialize(parent=nil)
    super
    setup_ui(self)
    @deg_extract.maximum = Extraction::R_MAX
    @calc.connect(SIGNAL :clicked) do
      coef_ex = @coef_extract.value
      vol_w = @vol_whater.value
      vol_o = @vol_organic.value
      @deg_ext = coef_ex / (coef_ex + vol_w / vol_o)
      @deg_extract.value = 100.0 * @deg_ext
      draw_plot if @deg_ext > 0
    end
    init_plot
    init_tracking
  end

  def init_tracking
    @plot.canvas.mouse_tracking = true
    connect Extraction::MouseSpy.new(@plot.canvas),
      SIGNAL('mouseMove(const QPoint &)'),
      SLOT('show_coordinates(const QPoint &)')
    @status_bar.show_message 'При передвижении указателя в статусе будут отображаться координаты'
  end

  def init_plot_items
    @plot.detach_items
    grid = Qwt::PlotGrid.new
    grid.enable_x_min(true)
    grid.maj_pen = Qt::Pen.new(Qt::Brush.new(Qt::gray), 0, Qt::SolidLine)
    grid.min_pen = Qt::Pen.new(Qt::Brush.new(Qt::gray), 0, Qt::SolidLine)
    grid.attach @plot
  end

  def init_plot
    @plot.title = 'Зависимость степени извлечения от кол-ва экстракций'
    @plot.canvas_background = Qt::Color.new(Qt::white)
    @plot.canvas_line_width = 2
    @plot.plot_layout.canvas_margin = 0
    @plot.plot_layout.align_canvas_to_scales = true
    @plot.set_axis_title @plot.xBottom, 'количество экстракций, n'
    @plot.set_axis_title @plot.yLeft, 'степень извлечения, R'
    #@plot.set_axis_auto_scale(@plot.xBottom)
    #@plot.set_axis_auto_scale(@plot.yLeft)
    @plot.set_axis_scale(@plot.xBottom, 1, @max_iter.value)
    @plot.set_axis_scale(@plot.yLeft, 0, Extraction::R_MAX)
    init_plot_items
  end

  def draw_derivative(x)
    dy = (Extraction::R_MAX * x).collect { |i| Extraction::Calculations.derivative_of_de(@deg_ext, i) }
    curve_deriv = Qwt::PlotCurve.new('производная')
    curve_deriv.set_data(x.to_a, dy.to_a)
    pen_deriv = Qt::Pen.new(Qt::red)
    pen_deriv.width = 1
    curve_deriv.pen = pen_deriv
    curve_deriv.render_hint = Qwt::PlotItem::RenderAntialiased
    curve_deriv.attach @plot
  end

  def draw_main(x)
    y = (Extraction::R_MAX * x).collect { |i| Extraction::Calculations.degree_of_extraction(@deg_ext, i) }
    curve = Qwt::PlotCurve.new('график')
    curve.set_data(x.to_a, y.to_a)
    pen = Qt::Pen.new(Qt::black)
    pen.width = 1
    curve.pen = pen
    curve.render_hint = Qwt::PlotItem::RenderAntialiased
    curve.attach @plot
  end

  def set_axis
    @plot.set_axis_scale(@plot.xBottom, 1, @max_iter.value)
    @plot.set_axis_scale(@plot.yLeft, @deg_ext, 1)
    @plot.set_axis_auto_scale(@plot.yLeft)
    @plot.replot
  end

  def draw_plot
    @status_bar.show_message('Построение графика')
    init_plot_items
    x = NArray.float((@max_iter.value)/0.01).indgen * 0.01
    draw_main(x)
    draw_derivative(x)
    set_axis
    @status_bar.show_message('График создан')
  end

  def show_coordinates(position)
    msg = 'x = %+.6g, y = %+.6g' % [@plot.invTransform(Qwt::Plot::xBottom, position.x),
                                    @plot.invTransform(Qwt::Plot::yLeft, position.y)]
    @status_bar.show_message msg
  end

end
