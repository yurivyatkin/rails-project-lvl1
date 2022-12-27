# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'

  def self.form_for(entity, form_options = {})
    url = form_options[:url] || '#'
    form_builder = FormBuilder.new(entity)
    # Here we abuse the fact that the block is supposed to contain calls to imput method,
    # and that the input method returns the accumulated array of tags:
    tags = block_given? ? yield(form_builder) : []
    content = tags.join
    "<form action=\"#{url}\" method=\"post\">#{content}</form>"
  end
end
