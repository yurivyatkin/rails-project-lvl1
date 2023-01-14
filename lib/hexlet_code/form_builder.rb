# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @tags = []
    end

    def input(field, options = {})
      rest = options.except(:as, :cols, :rows)
      tag = if options[:as] == :text
              cols = options[:cols] || 20
              rows = options[:rows] || 40
              HexletCode::Tag.build('textarea', name: field, cols: cols, rows: rows, **rest) { @entity[field] }
            else
              HexletCode::Tag.build('label', for: field) { field.capitalize } +
                HexletCode::Tag.build('input', name: field, type: 'text', value: @entity[field], **rest)
            end
      @tags << tag
    end

    def submit(title = 'Save')
      @tags << HexletCode::Tag.build('input', type: 'submit', value: title)
    end
  end
end
