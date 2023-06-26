# frozen_string_literal: true

module HexletCode
  module Controls
    class Label
      def initialize(name, value, **attributes)
        @name = name
        @value = value
        @attributes = attributes
      end

      def build
        control = {}
        control[:as] = 'label'
        control[:attributes] = { for: @name }
        control[:content] = @name.capitalize
        control
      end
    end
  end
end
