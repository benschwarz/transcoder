module Transcoder
  class Feed < Parser
    identifier "application/atom+xml",
               "application/rss+xml"
    
    autoload :Handler, "feed/handler"
  
    def self.parse(raw)
      Feed::Handler.parse(raw)
    end
  end
end