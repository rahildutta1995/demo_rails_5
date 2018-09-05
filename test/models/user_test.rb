require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user  = User.new name: "Rahil" ,email: "rahil.max4@gmail.com",password: "test123",password_confirmation: "test123"
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name cannot be blank" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email cant be blank" do 
    @user.email = "  "
    assert_not @user.valid?
  end

  test "valid email address" do 
    valid_email_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_email_addresses.each do |valid_email|
      @user.email = valid_email
      assert @user.valid? , "#{valid_email.inspect} should be valid"
    end
  end

  test "email cant be duplicate" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    diff_case_email = "Foo@ExAMPle.CoM"
    @user.email = diff_case_email
    @user.save
    assert_equal diff_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do 
    @user.password = @user.password_confirmation = " " * 3 
    assert_not @user.valid?
  end

  test "password should be minimum 6 characters" do 
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
