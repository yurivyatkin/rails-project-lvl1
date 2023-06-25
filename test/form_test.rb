# frozen_string_literal: true

require 'test_helper'

class FormTest < Minitest::Test
  TestEntity = Struct.new(:name, :description, keyword_init: true)
  def setup
    @test_entity = TestEntity.new(name: 'Test', description: 'This is a test!')
  end

  def test_form_raises_when_given_no_entity
    assert_raises ArgumentError do
      HexletCode::Form.new
    end
  end

  def test_form_input_raises_when_given_field_missing_from_entity
    form = HexletCode::Form.new(@test_entity)
    assert_raises NameError do
      form.input :non_existent_field
    end
  end
end
