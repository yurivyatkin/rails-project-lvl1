# frozen_string_literal: true

require 'test_helper'

class FormBuilderTest < Minitest::Test
  def test_form_builder_raises_when_given_no_entity
    assert_raises ArgumentError do
      HexletCode::FormBuilder.new
    end
  end

  Entity = Struct.new(:name)
  def test_form_builder_has_instance_variable_entity
    entity = Entity.new
    form_builder = HexletCode::FormBuilder.new(entity)
    assert_includes(form_builder.instance_variables, :@entity)
  end
end
