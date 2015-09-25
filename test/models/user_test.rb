require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Abhijeet", email:"abhijeet@gmail.com", password: "qwerty", password_confirmation: "qwerty")
  end 

  test "should be valid" do 
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = " "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "name should not be  too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email validation should accept valid address" do
  	invalid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    invalid_addresses.each do |addr|
    	@user.email = addr
    	assert @user.valid?, "#{addr.inspect} should be valid"
    end
  end

  test "email should be unique" do
  	duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
  	@user.password = @user.password_confirmation = " " * 6
  	assert_not @user.valid?
  end

  test "password should have a minimum length" do
  	@user.password = "a" * 5
  	assert_not @user.valid?
  end

  test "Email should be saved as downcase" do
  	mixed_case_email = "aBHijeEt@gmaIL.Com"
  	@user.email = mixed_case_email
  	@user.save
  	assert_not_equal mixed_case_email, @user.reload.email
  end

  test "validate email" do
  	test_email = "foo@bar..com"
  	@user.email = test_email
  	assert_not @user.valid?
  end

end
