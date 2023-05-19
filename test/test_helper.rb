# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/assertions'

require 'nokogiri'

module Minitest
  module Assertions
    def assert_selector(html_string, css_selector)
      doc = Nokogiri::HTML.parse(html_string)
      elements = doc.css(css_selector)

      assert(!elements.empty?, "No elements found matching CSS selector '#{css_selector}'")

      elements.each do |element|
        yield element.content.strip if block_given?
      end
    end
  end
end
