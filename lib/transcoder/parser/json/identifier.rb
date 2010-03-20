module Transcoder
  class Json < Parser
    identifier "json",
               "application/json",
               "application/x-javascript",
               "text/javascript",
               "text/x-javascript",
               "text/x-json"
               
    autoload :Handler, "json/handler"
    
    def self.generate(objects)
      raise TypeError unless objects.is_a? Hash or objects.is_a? Array
      Json::Handler.generate(objects)
    end
    
    def self.parse(raw)
      Json::Handler.parse(raw)
    end
  end
end