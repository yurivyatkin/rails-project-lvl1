# frozen_string_literal: true

require_relative 'controls'

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @controls = []
    end

    def input(field, options = {})
      rest = options.except(:as)
      value = @entity.public_send(field)
      type = options[:as] == :text ? 'TextArea' : 'TextInput'
      control = Object.const_get("HexletCode::Controls::#{type}").new(field, value, **rest)
      @controls << control
    end

    def submit(title = 'Save', **attributes)
      @controls << HexletCode::Controls::SubmitButton.new(title, **attributes)
    end

    def build(form_options = {})
      url = form_options[:url] || '#'
      method = form_options[:method] || 'post'
      rest = form_options.except(:url, :method)
      content = @controls.map(&:build).join
      HexletCode::Tag.build('form', action: url.to_s, method:, **rest) { content }
    end
  end
end
