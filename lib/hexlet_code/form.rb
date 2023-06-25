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
      label = HexletCode::Controls::Label.new(field, value, **rest)
      @controls << label
      control = Object.const_get("HexletCode::Controls::#{type}").new(field, value, **rest)
      @controls << control
    end

    def submit(title = 'Save', **attributes)
      @controls << HexletCode::Controls::Submit.new(title, **attributes)
    end

    def build
      form = {}
      url = @form_options[:url] || '#'
      rest = @form_options.except(:url)
      form[:options] = { action: url, method: 'post' }.merge(rest)
      form[:controls] = @controls
      form
    end
  end
end
