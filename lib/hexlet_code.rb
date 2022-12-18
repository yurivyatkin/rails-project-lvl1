# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  UNPARED_ELEMENTS = %w[br hr img].freeze

  PARED_ELENENTS = %w[div span p h1 h2 h3 h4 h5 h6].freeze

  class Tag
    def self.build(tag)
      normalized_tag = tag.downcase

      return "<#{normalized_tag}>" if UNPARED_ELEMENTS.include?(normalized_tag)

      return "<#{normalized_tag}></#{normalized_tag}>" if PARED_ELENENTS.include?(normalized_tag)

      raise 'Unknown tag'
    end
  end
end
