# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Form, 'hexlet_code/form_for'
  autoload :TextArea, 'hexlet_code/controls/textarea'
  autoload :TextInput, 'hexlet_code/controls/text_input'
  autoload :SubmitButton, 'hexlet_code/controls/submit_button'

  extend HexletCode::Form
end
