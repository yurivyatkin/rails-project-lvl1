# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
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
end
