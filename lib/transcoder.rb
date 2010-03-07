require 'registry'

module Transcoder
  class Parser
    extend Registry
  end
end

$LOAD_PATH << File.dirname(__FILE__)

require 'transcoder/parser/json'
require 'transcoder/parser/xml'
require 'transcoder/parser/feed'