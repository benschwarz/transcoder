require 'registry'

module Transcoder
  class Parser
    extend Registry
  end
end

require 'transcoder/parser/json'
require 'transcoder/parser/xml'
require 'transcoder/parser/feed'