# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_form_for
    user = User.new name: 'rob'
    form = HexletCode.form_for user do |f|
    end

    assert_equal('<form action="#" method="post"></form>', form)
  end

  def test_form_for_with_url
    user = User.new name: 'rob'
    form = HexletCode.form_for user, url: '/users' do |f|
    end

    assert_equal('<form action="/users" method="post"></form>', form)
  end
end
