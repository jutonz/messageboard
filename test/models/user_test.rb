require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "join_date correctly formats date" do
    assert_equal "July 22, 2014", users(:justin).join_date
  end

  test "gets correct display_name" do
    assert_equal "Jeremy Rowe", users(:jeremy).display_name
  end
end
