# frozen_string_literal: true

module HexletCode
  UNPAIRED_ELEMENTS = %w[br hr img input].freeze

  PAIRED_ELENENTS = %w[div span p h1 h2 h3 h4 h5 h6 label textarea].freeze

  class Tag
    def self.build(tag, attributes = {})
      normalized_tag = tag.downcase
      attributes_string = hash_to_string(attributes)

      return "<#{normalized_tag}#{attributes_string}>" if UNPAIRED_ELEMENTS.include?(normalized_tag)

      content = block_given? ? yield : ''
      if PAIRED_ELENENTS.include?(normalized_tag)
        return "<#{normalized_tag}#{attributes_string}>#{content}</#{normalized_tag}>"
      end

      raise 'Unknown tag'
    end

    def self.hash_to_string(hash)
      result = ''.dup
      hash.each_pair { |k, v| result << " #{k}=\"#{v}\"" }
      result
    end
  end
end
