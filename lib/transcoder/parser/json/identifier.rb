module Transcoder
  class Json < Parser
    identifier "application/json",
               "application/x-javascript",
               "text/javascript",
               "text/x-javascript",
               "text/x-json"
               
    autoload :Handler, "json/handler"
    
    def self.parse(raw)
      Json::Handler.parse(raw)
    end
  end
end