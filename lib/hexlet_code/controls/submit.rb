# frozen_string_literal: true

module HexletCode
  module Controls
    class Submit
      def initialize(value, **attributes)
        @value = value
        @attributes = attributes
      end

      def build
        {
          as: 'input',
          attributes: { type: 'submit', value: @value }.merge(@attributes)
        }
      end
    end
  end
end
