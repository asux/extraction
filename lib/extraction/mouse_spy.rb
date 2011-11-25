class Extraction::MouseSpy < Qt::Object
  def initialize(parent)
    super
    parent.mouse_tracking = true
    parent.install_event_filter(self)
  end

  def event_filter(obj, event)
    emit SIGNAL("MouseMove"), event.pos if event.is_a?(Qt::Event::MouseMove)
  end
end
