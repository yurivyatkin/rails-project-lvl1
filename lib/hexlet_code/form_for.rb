# frozen_string_literal: true

module HexletCode
  module Form
    def form_for(entity, form_options = {})
      url = form_options[:url] || '#'
      form_builder = FormBuilder.new(entity)
      # Here we abuse the fact that the block is supposed to contain calls to input method,
      # and that the input method returns the accumulated array of tags:
      tags = block_given? ? yield(form_builder) : []
      content = tags.join
      HexletCode::Tag.build('form', action: url.to_s, method: 'post') { content }
    end
  end
end
