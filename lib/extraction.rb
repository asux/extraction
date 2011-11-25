require 'rubygems'
require 'Qt'
require 'qwt'
require 'narray'

$KCODE = 'u' if RUBY_VERSION < '1.9'

module Extraction
  R_MAX = 100.0
end

require 'extraction/core_ext'
require 'extraction/mouse_spy'
require 'extraction/calculations'
require 'extraction/extraction_widget'

