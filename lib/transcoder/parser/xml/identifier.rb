module Transcoder
  class XML < Parser
    identifier "text/xml",
               "application/xml"

    autoload :GeneratorHandler, "xml/generator_handler"
    autoload :ParserHandler,    "xml/parser_handler"
    
    def self.generate(objects)
      builder = XML::GeneratorHandler.new do |xml|
        xml.items {
          objects.each do |item|
            xml.item {
              %w(id type class fork).each{|m| item["#{m}_".to_sym] = item.delete(m.to_sym) if item.is_a? Hash }
            
              item.each do |k, v|
                xml.__send__(k, v)
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