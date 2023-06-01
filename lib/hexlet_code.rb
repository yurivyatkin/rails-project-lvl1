# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'

  def self.form_for(entity, form_options = {})
    form_builder = FormBuilder.new(entity)
    yield(form_builder) if block_given?
    form_builder.build(form_options)
  end
end
