# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @controls = []
    end

    def input(field, options = {})
      rest = options.except(:as, :cols, :rows)
      value = @entity.public_send(field)
      tag = if options[:as] == :text
              cols = options[:cols] || 20
              rows = options[:rows] || 40
              HexletCode::Tag.build('textarea', name: field, cols: cols, rows: rows, **rest) { value }
            else
              HexletCode::Tag.build('label', for: field) { field.capitalize } +
                HexletCode::Tag.build('input', name: field, type: 'text', value: value, **rest)
            end
      @controls << tag
    end

    def submit(title = 'Save')
      @controls << HexletCode::Tag.build('input', type: 'submit', value: title)
    end

    def build(form_options = {})
      url = form_options[:url] || '#'
      HexletCode::Tag.build('form', action: url.to_s, method: 'post') { @controls.join }
    end
  end
end
