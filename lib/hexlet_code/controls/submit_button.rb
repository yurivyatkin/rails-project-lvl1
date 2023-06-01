# frozen_string_literal: true

module HexletCode
  module Controls
    class SubmitButton
      def initialize(value, **attributes)
        @value = value
        @attributes = attributes
      end

      def build
        HexletCode::Tag.build('input', type: 'submit', value: @value, **@attributes)
      end
    end
  end
end
