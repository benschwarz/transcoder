module Transcoder
  class XML < Parser
    identifier "text/xml",
               "application/xml"

    autoload :Handler, "xml/handler"
             
    def self.parse(raw)
      XML::Handler.parse(raw)
    end
  end
end