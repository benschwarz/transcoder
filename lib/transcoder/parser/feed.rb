require "simple-rss"

module Transcoder
  class Feed < Parser
    identifier "application/atom+xml",
               "application/rss+xml"
  
    def self.parse(raw)
      ::SimpleRSS.parse(raw)
    end
  end
end