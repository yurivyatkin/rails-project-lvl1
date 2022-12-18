# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_builds_tag_br
    assert HexletCode::Tag.build('br') == '<br>'
  end
end
