# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'

  def self.form_for(entity, form_options = {})
    form = Form.new(entity)
    yield(form) if block_given?
    form.build(form_options)
  end
end
