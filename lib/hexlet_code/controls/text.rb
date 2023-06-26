# frozen_string_literal: true

module HexletCode
  module Controls
    class Text
      def initialize(name, value, **attributes)
        @name = name
        @value = value
        @attributes = attributes
      end

      def build
        {
          as: 'textarea',
          attributes: { name: @name, cols: 20, rows: 40 }.merge(@attributes),
          content: @value
        }
      end
    end
  end
end
