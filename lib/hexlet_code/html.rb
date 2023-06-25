# frozen_string_literal: true

module HexletCode
  module Html
    def self.render(form)
      options = form[:options]
      controls = form[:controls]
      content = controls.map(&:build).join
      HexletCode::Tag.build('form', **options) { content }
    end
  end
end
