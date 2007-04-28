module Validatable
  class ValidatesFormatOf < ValidationBase #:nodoc:
    option :with
  
    def valid?(instance)
      not (instance.send(self.attribute).to_s =~ self.with).nil?
    end
    
    def message
      super || "is invalid"
    end
  end
end