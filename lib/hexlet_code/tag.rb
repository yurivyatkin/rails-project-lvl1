# frozen_string_literal: true

module HexletCode
  UNPAIRED_TAGS = %w[br hr img input].freeze

  PAIRED_TAGS = %w[div span p h1 h2 h3 h4 h5 h6 label textarea form].freeze

  module Tag
    def self.build(control, attributes = {})
      normalized_tag = control.downcase
      attributes_string = hash_to_string(attributes)

      return "<#{normalized_tag}#{attributes_string}>" if UNPAIRED_TAGS.include?(normalized_tag)

      content = block_given? ? yield : ''
      if PAIRED_TAGS.include?(normalized_tag)
        return "<#{normalized_tag}#{attributes_string}>#{content}</#{normalized_tag}>"
      end

      raise ArgumentError, 'Unsupported tag'
    end

    private_class_method def self.hash_to_string(hash)
      result = ''.dup
      hash.each_pair { |k, v| result << " #{k}=\"#{v}\"" }
      result
    end
  end
end
