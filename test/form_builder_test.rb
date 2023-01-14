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

  def test_form_builder_input_raises_when_given_field_missing_from_entity
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    assert_raises NameError do
      form_builder.input :non_existent_field
    end
  end

  def test_form_builder_method_input
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :name
    expected = '<label for="name">Name</label>'.dup
    expected += '<input name="name" type="text" value="Test">'
    actual = form_builder.instance_variable_get(:@tags)[0]
    assert_equal(expected, actual)
  end

  def test_form_builder_method_input_with_additional_attributes
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :name, class: 'user-input'
    expected = '<label for="name">Name</label>'.dup
    expected += '<input name="name" type="text" value="Test" class="user-input">'
    actual = form_builder.instance_variable_get(:@tags)[0]
    assert_equal(expected, actual)
  end

  def test_form_builder_method_input_with_as_option
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :description, as: :text
    assert_equal(
      '<textarea name="description" cols="20" rows="40">This is a test!</textarea>',
      form_builder.instance_variable_get(:@tags)[0]
    )
  end

  def test_form_builder_method_input_with_as_option_and_overriding_default_values
    form_builder = HexletCode::FormBuilder.new(@test_entity)
    form_builder.input :description, as: :text, rows: 50, cols: 60
    assert_equal(
      '<textarea name="description" cols="60" rows="50">This is a test!</textarea>',
      form_builder.instance_variable_get(:@tags)[0]
    )
  end
end
