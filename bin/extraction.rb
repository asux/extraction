#!/usr/bin/env ruby
$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'rubygems'
require 'extraction'
require 'pry'

if $0 == __FILE__
  app = Qt::Application.new(ARGV)
  window = Extraction::ExtractionWidget.new
  rect = app.desktop.availableGeometry
  x = rect.width / 2 - window.width / 2
  y = rect.height / 2 - window.height / 2
  window.move(x, y)
  window.show
  app.exec
end
