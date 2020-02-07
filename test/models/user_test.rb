require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "123456", password_confirmation: "123456")
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name is too long" do
    @user.name = "a" * 60
    assert_not @user.valid?
  end

  test "name is too short" do
    @user.name = "a" * 3
    assert_not @user.valid?
  end

  test "email must be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email must be saved in downcase" do
    mix_case_email = "leVietHOANG@example.com"
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase, @user.reload.email
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "password must be contain 6-20 characters" do
    @user.password = @user.password_confirmation = "a" * 5

    assert_not @user.valid?
  end

  test "password mustbe not empty" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Hello world")
    assert_difference "Micropost.count", -1 do
      @user.destroy
    end
  end
end
