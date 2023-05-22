# frozen_string_literal: true

require 'test_helper'

class FormForTest < Minitest::Test
  FIXTURES = [
    'form_for_1.html',
    'form_for_2.html',
    'form_for_3.html',
    'form_for_4.html',
    'form_for_5.html',
    'form_for_6.html',
    'form_for_7.html'
  ].freeze

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for_raises_when_input_called_with_missing_field
    assert_raises NoMethodError do
      HexletCode.form_for @user do |f|
        f.input :missing_field
      end
    end
  end

  FIXTURES.each do |fixture|
    define_method("test_generate_html_code_with_#{fixture}") do
      expected_html = normalize_html(load_fixture(fixture))
      result = case_for_fixture(fixture)
      assert_equal(expected_html, result)
    end
  end

  private

  # rubocop:disable all
  def case_for_fixture(fixture)
    case fixture
    when 'form_for_1.html'
      HexletCode.form_for @user
    when 'form_for_2.html'
      HexletCode.form_for @user, url: '/users'
    when 'form_for_3.html'
      HexletCode.form_for @user do |f|
        f.input :job, as: :text
      end
    when 'form_for_4.html'
      HexletCode.form_for @user do |f|
        f.input :job, as: :text, rows: 50, cols: 60
      end
    when 'form_for_5.html'
      HexletCode.form_for @user do |f|
        f.input :name
        f.input :job, as: :text
      end
    when 'form_for_6.html'
      HexletCode.form_for @user do |f|
        f.input :name
        f.input :job
        f.submit
      end
    when 'form_for_7.html'
      HexletCode.form_for @user do |f|
        f.input :name
        f.input :job
        f.submit 'Wow'
      end
    end
  end
  # rubocop:enable all
end
