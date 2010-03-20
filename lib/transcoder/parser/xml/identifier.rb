module Transcoder
  class XML < Parser
    identifier "xml",
               "text/xml",
               "application/xml"

    autoload :GeneratorHandler, "xml/generator_handler"
    autoload :ParserHandler,    "xml/parser_handler"
    
    def self.generate(object)
      raise TypeError unless object.is_a? Hash or object.is_a? Array
      builder = XML::GeneratorHandler.new do |xml|
        xml.items {
          if object.is_a? Array
            object.each{|item| xml.item(:value => item) }
          elsif object.is_a? Hash
            xml.item {
              object.each do |key, value|
                # stringify the keys
                object[key.to_s] = object.delete(key)
                key = key.to_s
                
                # id, type, class and fork must be appended with _
                if key =~ /(id|type|class|fork)/
                  object["#{key}_"] = object.delete(key)
                  key = "#{key}_"
                end
              
                xml.send(key, value)
              end
            }
          end
        }
      end
    
      builder.to_xml
    end
             
    def self.parse(raw)
      XML::ParserHandler.parse(raw)
    end
  end
end