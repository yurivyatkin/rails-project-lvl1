# frozen_string_literal: true

module HexletCode
  module Controls
    class Submit
      def initialize(value, **attributes)
        @value = value
        @attributes = attributes
      end

      def build
        control = {}
        control[:as] = 'input'
        control[:attributes] = { type: 'submit', value: @value }.merge(@attributes)
        control
      end
    end
  end
end
