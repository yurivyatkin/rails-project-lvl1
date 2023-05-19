# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @controls = []
    end

    def input(field, options = {})
      rest = options.except(:as)
      value = @entity.public_send(field)
      control = if options[:as] == :text
                  HexletCode::TextArea.new(field, value, **rest)
                else
                  HexletCode::TextInput.new(field, value, **rest)
                end
      @controls << control
    end

    def submit(title = 'Save', **attributes)
      @controls << HexletCode::SubmitButton.new(title, **attributes)
    end

    def build(form_options = {})
      url = form_options[:url] || '#'
      content = @controls.map(&:build).join
      HexletCode::Tag.build('form', action: url.to_s, method: 'post') { content }
    end
  end
end
