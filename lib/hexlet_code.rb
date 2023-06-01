# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :TextArea, 'hexlet_code/controls/textarea'
  autoload :TextInput, 'hexlet_code/controls/text_input'
  autoload :SubmitButton, 'hexlet_code/controls/submit_button'

  def self.form_for(entity, form_options = {})
    form_builder = FormBuilder.new(entity)
    yield(form_builder) if block_given?
    form_builder.build(form_options)
  end
end
