# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  class Tag
    def self.build(tag)
      "<#{tag}>"
    end
  end
end
