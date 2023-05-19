# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_hash_to_string
    assert_equal(
      ' type="submit" value="Save"',
      HexletCode::Tag.send(:hash_to_string, { type: 'submit', value: 'Save' })
    )
  end

  def test_it_raises_given_unknown_tag
    assert_raises RuntimeError do
      HexletCode::Tag.build('qq')
    end
  end

  def test_it_builds_tag_br
    assert_equal('<br>', HexletCode::Tag.build('br'))
  end

  def test_it_builds_tag_div
    assert_equal('<div></div>', HexletCode::Tag.build('div'))
    assert_equal('<div></div>', HexletCode::Tag.build('DIV'))
  end

  def test_it_builds_tags_with_attributes
    assert_equal(
      '<img src="path/to/image">',
      HexletCode::Tag.build('img', src: 'path/to/image')
    )
    assert_equal(
      '<input type="submit" value="Save">',
      HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    )
  end

  def test_it_builds_tags_with_content
    assert_equal(
      '<label>Email</label>',
      HexletCode::Tag.build('label') { 'Email' }
    )
    assert_equal(
      '<label for="email">Email</label>',
      HexletCode::Tag.build('label', for: 'email') { 'Email' }
    )
  end
end
