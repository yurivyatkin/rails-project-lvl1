# frozen_string_literal: true

module HexletCode
  module Html
    def self.render(form)
      options = form[:options]
      controls = form[:controls]
      content = (controls.map { |c| render_tag(c) }).join
      HexletCode::Tag.build('form', **options) { content }
    end

    private_class_method def self.render_tag(control)
      HexletCode::Tag.build(control[:as], **control[:attributes]) do
        control[:content] || ''
      end
    end
  end
end
