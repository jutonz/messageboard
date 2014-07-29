require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def post
    @post ||= posts(:justins)
  end

  test "the post belongs to the correct user" do
    assert post.user == users(:justin)
  end

  test "#created_by returns the formatted user name" do
    assert_equal "Justin Toniazzo", post.created_by
  end

  test "is not valid when the title is longer than 100 characters" do
    post.title = "*" * 101
    refute post.valid?
  end

  test "is valid when the title is 100 or less long" do
    post.title = "*" * 100
    assert post.valid?
  end
end
