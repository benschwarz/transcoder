require 'registry'

module Transcoder
  VERSION = File.read(File.join(File.dirname(__FILE__), "..", "VERSION"))
  
  class Parser
    class TypeError < StandardError; end
    
    extend Registry
  end
  
  def self.for(mime)
    Parser.for(mime)
  end
end

$LOAD_PATH << File.dirname(__FILE__) + "/transcoder/parser"

require 'json/identifier'
require 'xml/identifier'
require 'feed/identifier'
require 'yaml/identifier'