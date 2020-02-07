require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @micropost = @user.microposts.build(content: "Hello world")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  test "content is too long" do
    @micropost.content = "a" * 220
    assert_not @micropost.valid?
  end

  test "order must be true" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
