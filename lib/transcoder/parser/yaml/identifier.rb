# Autoload is fine, its apart of ruby-core.
autoload :YAML, "yaml"

module Transcoder
  class Yaml < Parser
    identifier "yaml",
               "text/yaml",
               "text/x-yaml",
               "application/yaml",
               "application/x-yaml"
    
    def self.generate(objects)
      raise TypeError unless objects.is_a? Hash or objects.is_a? Array
      YAML.dump(objects)
    end
    
    def self.parse(raw)
      YAML.load(raw)
    end
  end
end