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

  def test_form_builder_has_instance_variable_entity
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    assert_includes(form_builder.instance_variables, :@entity)
  end

  def test_form_builder_has_instance_variable_tags
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    assert_includes(form_builder.instance_variables, :@tags)
  end

  def test_form_builder_instance_variable_tags_is_an_array
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    assert_instance_of(Array, form_builder.instance_variable_get(:@tags))
  end

  def test_form_builder_method_input
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :name
    assert_equal(
      '<input name="name" type="text" value="Test">',
      form_builder.instance_variable_get(:@tags)[0]
    )
  end

  def test_form_builder_method_input_with_as_option
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :description, as: :text
    assert_equal(
      '<textarea name="description" cols="20" rows="40">This is a test!</textarea>',
      form_builder.instance_variable_get(:@tags)[0]
    )
  end
end
