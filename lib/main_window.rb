=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: Fri Nov 25 18:17:28 2011
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

module UiMainWindow
    attr_reader :central_widget
    attr_reader :tab_widget
    attr_reader :tab_input
    attr_reader :layoutWidget
    attr_reader :form_layout
    attr_reader :l_max
    attr_reader :l_coef_exl
    attr_reader :l_vol_o
    attr_reader :l_vol_w
    attr_reader :vol_whater
    attr_reader :coef_extract
    attr_reader :vol_organic
    attr_reader :max_iter
    attr_reader :l_deg_ex
    attr_reader :deg_extract
    attr_reader :calc
    attr_reader :tab_table
    attr_reader :table_view
    attr_reader :tab_graph
    attr_reader :plot
    attr_reader :status_bar

    def setupUi(main_window)
    if main_window.objectName.nil?
        main_window.objectName = "main_window"
    end
    main_window.resize(650, 720)
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy.setHorizontalStretch(1)
    @sizePolicy.setVerticalStretch(1)
    @sizePolicy.heightForWidth = main_window.sizePolicy.hasHeightForWidth
    main_window.sizePolicy = @sizePolicy
    @central_widget = Qt::Widget.new(main_window)
    @central_widget.objectName = "central_widget"
    @sizePolicy.heightForWidth = @central_widget.sizePolicy.hasHeightForWidth
    @central_widget.sizePolicy = @sizePolicy
    @tab_widget = Qt::TabWidget.new(@central_widget)
    @tab_widget.objectName = "tab_widget"
    @tab_widget.geometry = Qt::Rect.new(-2, 8, 648, 680)
    @sizePolicy.heightForWidth = @tab_widget.sizePolicy.hasHeightForWidth
    @tab_widget.sizePolicy = @sizePolicy
    @tab_input = Qt::Widget.new()
    @tab_input.objectName = "tab_input"
    @sizePolicy.heightForWidth = @tab_input.sizePolicy.hasHeightForWidth
    @tab_input.sizePolicy = @sizePolicy
    @layoutWidget = Qt::Widget.new(@tab_input)
    @layoutWidget.objectName = "layoutWidget"
    @layoutWidget.geometry = Qt::Rect.new(0, 0, 641, 591)
    @form_layout = Qt::FormLayout.new(@layoutWidget)
    @form_layout.spacing = 4
    @form_layout.margin = 4
    @form_layout.objectName = "form_layout"
    @form_layout.sizeConstraint = Qt::Layout::SetMinAndMaxSize
    @form_layout.setContentsMargins(0, 0, 0, 0)
    @l_max = Qt::Label.new(@layoutWidget)
    @l_max.objectName = "l_max"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Preferred)
    @sizePolicy1.setHorizontalStretch(1)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @l_max.sizePolicy.hasHeightForWidth
    @l_max.sizePolicy = @sizePolicy1

    @form_layout.setWidget(3, Qt::FormLayout::LabelRole, @l_max)

    @l_coef_exl = Qt::Label.new(@layoutWidget)
    @l_coef_exl.objectName = "l_coef_exl"
    @sizePolicy1.heightForWidth = @l_coef_exl.sizePolicy.hasHeightForWidth
    @l_coef_exl.sizePolicy = @sizePolicy1

    @form_layout.setWidget(0, Qt::FormLayout::LabelRole, @l_coef_exl)

    @l_vol_o = Qt::Label.new(@layoutWidget)
    @l_vol_o.objectName = "l_vol_o"
    @sizePolicy1.heightForWidth = @l_vol_o.sizePolicy.hasHeightForWidth
    @l_vol_o.sizePolicy = @sizePolicy1

    @form_layout.setWidget(2, Qt::FormLayout::LabelRole, @l_vol_o)

    @l_vol_w = Qt::Label.new(@layoutWidget)
    @l_vol_w.objectName = "l_vol_w"
    @sizePolicy1.heightForWidth = @l_vol_w.sizePolicy.hasHeightForWidth
    @l_vol_w.sizePolicy = @sizePolicy1

    @form_layout.setWidget(1, Qt::FormLayout::LabelRole, @l_vol_w)

    @vol_whater = Qt::DoubleSpinBox.new(@layoutWidget)
    @vol_whater.objectName = "vol_whater"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Fixed)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @vol_whater.sizePolicy.hasHeightForWidth
    @vol_whater.sizePolicy = @sizePolicy2
    @vol_whater.minimum = 0.01
    @vol_whater.maximum = 100000

    @form_layout.setWidget(1, Qt::FormLayout::FieldRole, @vol_whater)

    @coef_extract = Qt::DoubleSpinBox.new(@layoutWidget)
    @coef_extract.objectName = "coef_extract"
    @sizePolicy3 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Fixed)
    @sizePolicy3.setHorizontalStretch(1)
    @sizePolicy3.setVerticalStretch(0)
    @sizePolicy3.heightForWidth = @coef_extract.sizePolicy.hasHeightForWidth
    @coef_extract.sizePolicy = @sizePolicy3
    @coef_extract.maximum = 999.99

    @form_layout.setWidget(0, Qt::FormLayout::FieldRole, @coef_extract)

    @vol_organic = Qt::DoubleSpinBox.new(@layoutWidget)
    @vol_organic.objectName = "vol_organic"
    @sizePolicy3.heightForWidth = @vol_organic.sizePolicy.hasHeightForWidth
    @vol_organic.sizePolicy = @sizePolicy3
    @vol_organic.minimum = 0.01
    @vol_organic.maximum = 100000

    @form_layout.setWidget(2, Qt::FormLayout::FieldRole, @vol_organic)

    @max_iter = Qt::SpinBox.new(@layoutWidget)
    @max_iter.objectName = "max_iter"
    @sizePolicy3.heightForWidth = @max_iter.sizePolicy.hasHeightForWidth
    @max_iter.sizePolicy = @sizePolicy3
    @max_iter.minimum = 2

    @form_layout.setWidget(3, Qt::FormLayout::FieldRole, @max_iter)

    @l_deg_ex = Qt::Label.new(@layoutWidget)
    @l_deg_ex.objectName = "l_deg_ex"
    @sizePolicy1.heightForWidth = @l_deg_ex.sizePolicy.hasHeightForWidth
    @l_deg_ex.sizePolicy = @sizePolicy1

    @form_layout.setWidget(4, Qt::FormLayout::LabelRole, @l_deg_ex)

    @deg_extract = Qt::DoubleSpinBox.new(@layoutWidget)
    @deg_extract.objectName = "deg_extract"
    @sizePolicy3.heightForWidth = @deg_extract.sizePolicy.hasHeightForWidth
    @deg_extract.sizePolicy = @sizePolicy3
    @deg_extract.readOnly = true
    @deg_extract.decimals = 4
    @deg_extract.maximum = 100

    @form_layout.setWidget(4, Qt::FormLayout::FieldRole, @deg_extract)

    @calc = Qt::PushButton.new(@layoutWidget)
    @calc.objectName = "calc"
    @sizePolicy2.heightForWidth = @calc.sizePolicy.hasHeightForWidth
    @calc.sizePolicy = @sizePolicy2
    @font = Qt::Font.new
    @font.bold = true
    @font.weight = 75
    @calc.font = @font
    @calc.default = true

    @form_layout.setWidget(5, Qt::FormLayout::FieldRole, @calc)

    @tab_widget.addTab(@tab_input, Qt::Application.translate("main_window", "\320\222\320\262\320\276\320\264 \320\264\320\260\320\275\320\275\321\213\321\205", nil, Qt::Application::UnicodeUTF8))
    @tab_table = Qt::Widget.new()
    @tab_table.objectName = "tab_table"
    @sizePolicy4 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy4.setHorizontalStretch(0)
    @sizePolicy4.setVerticalStretch(0)
    @sizePolicy4.heightForWidth = @tab_table.sizePolicy.hasHeightForWidth
    @tab_table.sizePolicy = @sizePolicy4
    @table_view = Qt::TableView.new(@tab_table)
    @table_view.objectName = "table_view"
    @table_view.geometry = Qt::Rect.new(0, 0, 640, 640)
    @tab_widget.addTab(@tab_table, Qt::Application.translate("main_window", "\320\242\320\260\320\261\320\273\320\270\321\206\320\260", nil, Qt::Application::UnicodeUTF8))
    @tab_graph = Qt::Widget.new()
    @tab_graph.objectName = "tab_graph"
    @sizePolicy.heightForWidth = @tab_graph.sizePolicy.hasHeightForWidth
    @tab_graph.sizePolicy = @sizePolicy
    @plot = Qwt::Plot.new(@tab_graph)
    @plot.objectName = "plot"
    @plot.geometry = Qt::Rect.new(0, 0, 640, 640)
    @sizePolicy.heightForWidth = @plot.sizePolicy.hasHeightForWidth
    @plot.sizePolicy = @sizePolicy
    @plot.sizeIncrement = Qt::Size.new(1, 1)
    @tab_widget.addTab(@tab_graph, Qt::Application.translate("main_window", "\320\223\321\200\320\260\321\204\320\270\320\272", nil, Qt::Application::UnicodeUTF8))
    main_window.centralWidget = @central_widget
    @status_bar = Qt::StatusBar.new(main_window)
    @status_bar.objectName = "status_bar"
    main_window.statusBar = @status_bar
    Qt::Widget.setTabOrder(@coef_extract, @vol_whater)
    Qt::Widget.setTabOrder(@vol_whater, @vol_organic)
    Qt::Widget.setTabOrder(@vol_organic, @max_iter)

    retranslateUi(main_window)

    @tab_widget.setCurrentIndex(1)


    Qt::MetaObject.connectSlotsByName(main_window)
    end # setupUi

    def setup_ui(main_window)
        setupUi(main_window)
    end

    def retranslateUi(main_window)
    main_window.windowTitle = Qt::Application.translate("main_window", "Extraction", nil, Qt::Application::UnicodeUTF8)
    @l_max.text = Qt::Application.translate("main_window", "\320\234\320\260\320\272\321\201. \321\215\320\272\321\201\321\202\321\200\320\260\320\272\321\206\320\270\320\271, <b>n</b>", nil, Qt::Application::UnicodeUTF8)
    @l_coef_exl.text = Qt::Application.translate("main_window", "\320\232\320\276\320\265\321\204\320\270\321\206\320\265\320\275\321\202 \321\215\320\272\321\201\321\202\321\200\320\260\320\272\321\206\320\270\320\270, <b>D</b>", nil, Qt::Application::UnicodeUTF8)
    @l_vol_o.text = Qt::Application.translate("main_window", "\320\236\320\261\321\212\320\265\320\274 \320\276\321\200\320\263\320\260\320\275\320\270\321\207\320\265\321\201\320\272\320\276\320\271 \321\204\320\260\320\267\321\213, <b>Vo</b>", nil, Qt::Application::UnicodeUTF8)
    @l_vol_w.text = Qt::Application.translate("main_window", "\320\236\320\261\321\212\320\265\320\274 \320\262\320\276\320\264\320\275\320\276\320\271 \321\204\320\260\320\267\321\213, <b>Vw</b>", nil, Qt::Application::UnicodeUTF8)
    @l_deg_ex.text = Qt::Application.translate("main_window", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'DejaVu Sans'; font-size:10pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">\320\241\321\202\320\265\320\277\320\265\320\275\321\214 \320\270\320\267\320\262\320\273\320\265\321\207\320\265\320\275\320\270\321\217 \320\277\320\265\321\200\320\262\320\276\320\271 \321\215\320\272\321\201\321\202\321\200\320\260\320\272\321\206\320\270\320\270, <span style=\" font-weight:600;\">R</span><span style=\" font-weight:600; vertical-align:sub;\">1</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @deg_extract.styleSheet = Qt::Application.translate("main_window", "QDoubleSpinBox#degExtract { color: rgb(170, 0, 0); font-weight: bold}", nil, Qt::Application::UnicodeUTF8)
    @calc.text = Qt::Application.translate("main_window", "\320\237\320\265\321\200\320\265\321\201\321\207\320\270\321\202\320\260\321\202\321\214", nil, Qt::Application::UnicodeUTF8)
    @tab_widget.setTabText(@tab_widget.indexOf(@tab_input), Qt::Application.translate("main_window", "\320\222\320\262\320\276\320\264 \320\264\320\260\320\275\320\275\321\213\321\205", nil, Qt::Application::UnicodeUTF8))
    @tab_widget.setTabText(@tab_widget.indexOf(@tab_table), Qt::Application.translate("main_window", "\320\242\320\260\320\261\320\273\320\270\321\206\320\260", nil, Qt::Application::UnicodeUTF8))
    @tab_widget.setTabText(@tab_widget.indexOf(@tab_graph), Qt::Application.translate("main_window", "\320\223\321\200\320\260\321\204\320\270\320\272", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(main_window)
        retranslateUi(main_window)
    end

end
