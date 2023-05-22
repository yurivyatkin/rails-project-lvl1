# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/assertions'

def load_fixture(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end

def normalize_html(html_string)
  html_string.strip.gsub(/>\s+</, '><')
end
