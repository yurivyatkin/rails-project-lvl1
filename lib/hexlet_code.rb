# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(entity, form_options = {})
    url = form_options[:url] || '#'
    def entity.input(name, input_options = {})
      if input_options[:as] == :text
        return HexletCode::Tag.build('textarea', name: name, cols: 20, rows: 40) { self[name] }
      end

      HexletCode::Tag.build 'input', name: name, type: 'text', value: self[name]
    end
    content = block_given? ? yield(entity) : ''
    "<form action=\"#{url}\" method=\"post\">#{content}</form>"
  end
end
