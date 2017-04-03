module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, validation, parameter = nil)
      @validations ||= []
      @validations << { attr: name, validation: validation, parameter: parameter }
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get(:@validations)

      validations.each do |validation|
        attr = instance_variable_get("@#{validation[:attr]}")
        type_validation = validation[:validation]
        parameter = validation[:parameter]

        send(type_validation, attr, parameter)
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def presence_validation(attr, _parameter)
      raise 'your attribute is nil or empty !!!' if attr.nil? || attr.empty?
    end

    def format_validation(attr, parameter)
      raise 'Your attribute doesn\'t match the format!!!' if attr !~ parameter
    end

    def type_validation(attr, parameter)
      raise "Your attribute class not is #{parameter}" unless attr.is_a?(parameter)
    end
  end
end
