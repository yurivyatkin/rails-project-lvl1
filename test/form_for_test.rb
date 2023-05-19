# frozen_string_literal: true

require 'test_helper'

class FormForTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for_empty
    form = HexletCode.form_for @user

    assert_selector(form, "form[action='#'][method='post']")
  end

  def test_form_for_empty_with_url
    form = HexletCode.form_for @user, url: '/users'

    assert_selector(form, "form[action='/users'][method='post']")
  end

  def test_form_for_raises_when_input_called_with_missing_field
    assert_raises NoMethodError do
      HexletCode.form_for @user do |f|
        f.input :missing_field
      end
    end
  end

  def test_form_for_with_block_and_input_as_text
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_selector(form, "form[action='#'][method='post']")

    assert_selector(form, "form label[for='job']") do |e|
      assert_equal('Job', e)
    end
    assert_selector(form, "form textarea[name='job'][cols='20'][rows='40']") do |e|
      assert_equal('hexlet', e)
    end
  end

  def test_form_for_input_as_text_can_override_default_values
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 60
    end

    assert_selector(form, "form[action='#'][method='post']")

    assert_selector(form, "form label[for='job']") do |e|
      assert_equal('Job', e)
    end
    assert_selector(form, "form textarea[name='job'][cols='60'][rows='50']") do |e|
      assert_equal('hexlet', e)
    end
  end

  def test_form_for_with_block_and_one_text_input_and_one_textarea
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_selector(form, "form[action='#'][method='post']")

    assert_selector(form, "form label[for='name']") do |e|
      assert_equal('Name', e)
    end
    assert_selector(form, "form input[name='name'][type='text'][value='rob']")

    assert_selector(form, "form label[for='job']") do |e|
      assert_equal('Job', e)
    end
    assert_selector(form, "form textarea[name='job'][cols='20'][rows='40']") do |e|
      assert_equal('hexlet', e)
    end
  end

  def test_form_for_with_two_inputs_and_default_submit
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_selector(form, "form[action='#'][method='post']")

    assert_selector(form, "form label[for='name']") do |e|
      assert_equal('Name', e)
    end
    assert_selector(form, "form input[name='name'][type='text'][value='rob']")

    assert_selector(form, "form label[for='job']") do |e|
      assert_equal('Job', e)
    end
    assert_selector(form, "form input[name='job'][type='text'][value='hexlet']")

    assert_selector(form, "form input[type='submit'][value='Save']")
  end

  def test_form_for_with_two_inputs_and_custom_submit
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_selector(form, "form[action='#'][method='post']")

    assert_selector(form, "form label[for='name']") do |e|
      assert_equal('Name', e)
    end
    assert_selector(form, "form input[name='name'][type='text'][value='rob']")

    assert_selector(form, "form label[for='job']") do |e|
      assert_equal('Job', e)
    end
    assert_selector(form, "form input[name='job'][type='text'][value='hexlet']")

    assert_selector(form, "form input[type='submit'][value='Wow']")
  end
end
