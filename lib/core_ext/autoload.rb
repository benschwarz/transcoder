class Object
  class << self
    alias_method :_const_missing, :const_missing
    private :_const_missing
    
    def const_missing(constant)
      if Kernel._autoloads.key? constant
        require Kernel._autoloads[constant]
        const_get(constant)
      else 
        _const_missing(constant)
      end
    end
  end
end

module Kernel
  module_function :autoload
  
  def _autoloads
    @@_autoloads
  end
  
  def autoload(const, path)
    (@@_autoloads||={})[const] = path
  end
end
