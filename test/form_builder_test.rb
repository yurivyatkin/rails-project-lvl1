# frozen_string_literal: true

require 'test_helper'

class FormBuilderTest < Minitest::Test
  TestEntity = Struct.new(:name, :description, keyword_init: true)
  def setup
    @test_entity = TestEntity.new(name: 'Test', description: 'This is a test!')
  end

  def test_form_builder_raises_when_given_no_entity
    assert_raises ArgumentError do
      HexletCode::FormBuilder.new
    end
  end

  def test_form_builder_input_raises_when_given_field_missing_from_entity
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    assert_raises NameError do
      form_builder.input :non_existent_field
    end
  end
end
