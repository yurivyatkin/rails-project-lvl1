# frozen_string_literal: true

require 'test_helper'

class FormBuilderTest < Minitest::Test
  def test_form_builder_raises_when_given_no_entity
    assert_raises ArgumentError do
      HexletCode::FormBuilder.new
    end
  end
end
