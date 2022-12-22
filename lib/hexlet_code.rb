# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(_entity, options = {})
    url = options[:url] || '#'
    "<form action=\"#{url}\" method=\"post\"></form>"
  end
end
