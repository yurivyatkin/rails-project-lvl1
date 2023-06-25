# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Html, 'hexlet_code/html'

  def self.form_for(entity, form_options = {})
    form = Form.new(entity, form_options)
    yield(form) if block_given?
    Html.render(form.build)
  end
end
