autoload :Crack, "crack"

module Transcoder
  class XML < Parser
    identifier "text/xml",
               "application/xml"
             
    def self.parse(raw)
      Crack::XML.parse(raw)
    end
  end
end