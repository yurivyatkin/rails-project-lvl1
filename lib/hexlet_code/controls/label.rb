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
        HexletCode::Tag.build('label', for: @name) do
          @name.capitalize
        end
      end
    end
  end
end
