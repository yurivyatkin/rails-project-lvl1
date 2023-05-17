# frozen_string_literal: true

module HexletCode
  module Form
    def form_for(entity, form_options = {})
      form_builder = FormBuilder.new(entity)
      yield(form_builder) if block_given?
      form_builder.build(form_options)
    end
  end
end
