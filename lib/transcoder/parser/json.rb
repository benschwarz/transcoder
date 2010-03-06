autoload :JSON, "json"

module Transcoder
  class Json < Parser
    identifier "application/json",
               "application/x-javascript",
               "text/javascript",
               "text/x-javascript",
               "text/x-json"
               
    def self.parse(raw)
      ::JSON.parse(raw)
    end
  end
end