module Validatable
  class ValidatesLengthOf < ValidationBase #:nodoc:
    option :minimum, :maximum, :is, :within
    
    def message
      super || "is invalid"
    end
    
    def valid?(instance)
      valid = true
      value = instance.send(self.attribute) || ""

      valid &&= value.length <= maximum unless maximum.nil? 
      valid &&= value.length >= minimum unless minimum.nil?
      valid &&= value.length == is unless is.nil?
      valid &&= within.include?(value.length) unless within.nil?
      valid
    end
  end
end
