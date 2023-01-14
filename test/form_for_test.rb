# frozen_string_literal: true

require 'test_helper'

class FormForTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for_empty
    form = HexletCode.form_for @user

    assert_equal('<form action="#" method="post"></form>', form)
  end

  def test_form_for_empty_with_url
    form = HexletCode.form_for @user, url: '/users'

    assert_equal('<form action="/users" method="post"></form>', form)
  end

  def test_form_for_with_block
    form = HexletCode.form_for @user do |f|
      f.input :name
    end
    expected = '<form action="#" method="post">'.dup
    expected += '<label for="name">Name</label>'
    expected += '<input name="name" type="text" value="rob">'
    expected += '</form>'
    assert_equal(expected, form)
  end

  def test_form_for_with_block_and_input_as_text
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal('<form action="#" method="post"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>',
                 form)
  end

  # TODO: should we test this here?
  def test_form_for_input_can_override_default_values
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 60
    end

    assert_equal('<form action="#" method="post"><textarea name="job" cols="60" rows="50">hexlet</textarea></form>',
                 form)
  end

  def test_form_for_with_block_and_two_inputs
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = '<form action="#" method="post">'.dup
    expected += '<label for="name">Name</label>'
    expected += '<input name="name" type="text" value="rob">'
    expected += '<textarea name="job" cols="20" rows="40">hexlet</textarea>'
    expected += '</form>'
    assert_equal(expected, form)
  end

  def test_form_for_with_two_inputs_and_default_submit
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    expected = '<form action="#" method="post">'.dup
    expected += '<label for="name">Name</label><input name="name" type="text" value="rob">'
    expected += '<label for="job">Job</label><input name="job" type="text" value="hexlet">'
    expected += '<input type="submit" value="Save"></form>'
    assert_equal(expected, form)
  end

  def test_form_for_with_two_inputs_and_custom_submit
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    expected = '<form action="#" method="post">'.dup
    expected += '<label for="name">Name</label><input name="name" type="text" value="rob">'
    expected += '<label for="job">Job</label><input name="job" type="text" value="hexlet">'
    expected += '<input type="submit" value="Wow"></form>'
    assert_equal(expected, form)
  end
end
