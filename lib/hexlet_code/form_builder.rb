# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @tags = []
    end

    def input(field)
      @tags << (HexletCode::Tag.build 'input', name: field, type: 'text', value: @entity[field])
    end
  end
end
