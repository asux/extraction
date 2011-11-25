module Extraction::CoreExt
  module String
    def to_qt(*args)
      Qt::String.new(self, *args)
    end
  end
end

String.send :include, Extraction::CoreExt::String
