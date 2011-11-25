class Extraction::MouseSpy < Qt::Object
  signals 'mouseMove(const QPoint &)'

  def initialize(parent)
    super
    parent.mouse_tracking = true
    parent.install_event_filter(self)
  end

  def eventFilter(obj, event)
    if event.type == Qt::Event::MouseMove
      emit mouseMove(event.pos)
    end
    false
  end
end
