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
        {
          as: 'label',
          attributes: { for: @name },
          content: @name.capitalize
        }
      end
    end
  end
end
