require 'registry'

module Transcoder
  VERSION = File.read(File.join(File.dirname(__FILE__), "..", "VERSION"))
  
  class Parser
    extend Registry
  end
  
  def self.for(mime)
    Parser.for(mime)
  end
end

# Autoload that works with Rubygems, 
# rather than from the current $LOAD_PATH only
require 'core_ext/autoload'

$LOAD_PATH << File.dirname(__FILE__)

require 'transcoder/parser/json'
require 'transcoder/parser/xml'
require 'transcoder/parser/feed'
require 'transcoder/parser/yaml'