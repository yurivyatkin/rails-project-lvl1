# frozen_string_literal: true

module HexletCode
  module Controls
    class Input
      def initialize(name, value, **attributes)
        @name = name
        @value = value
        @attributes = attributes
      end

      def build
        HexletCode::Tag.build('label', for: @name) do
          @name.capitalize
        end + HexletCode::Tag.build('input', name: @name, type: 'text', value: @value, **@attributes)
      end
    end
  end
end
