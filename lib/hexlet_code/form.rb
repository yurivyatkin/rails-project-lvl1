# frozen_string_literal: true

require_relative 'controls'

module HexletCode
  class Form
    def initialize(entity, form_options = {})
      @entity = entity
      @form_options = form_options
      @controls = []
    end

    def input(field, options = {})
      rest = options.except(:as)
      value = @entity.public_send(field)
      type = (options[:as] || 'input').capitalize
      control = Object.const_get("HexletCode::Controls::#{type}").new(field, value, **rest)
      @controls << control
    end

    def submit(title = 'Save', **attributes)
      @controls << HexletCode::Controls::Submit.new(title, **attributes)
    end

    def build
      url = @form_options[:url] || '#'
      method = @form_options[:method] || 'post'
      rest = @form_options.except(:url, :method)
      content = @controls.map(&:build).join
      HexletCode::Tag.build('form', action: url.to_s, method:, **rest) { content }
    end
  end
end
