# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @tags = []
    end

    def input(field, options = {})
      tag = if options[:as] == :text
              HexletCode::Tag.build('textarea', name: field, cols: 20, rows: 40) { @entity[field] }
            else
              HexletCode::Tag.build('input', name: field, type: 'text', value: @entity[field])
            end
      @tags << tag
    end
  end
end
