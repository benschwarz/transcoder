# Autoload is fine, its apart of ruby-core.
autoload :YAML, "yaml"

module Transcoder
  class Yaml < Parser
    identifier "text/yaml",
               "text/x-yaml",
               "application/yaml",
               "application/x-yaml"
    
    def self.parse(raw)
      YAML.load(raw)
    end
  end
end