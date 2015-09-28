require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest



  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example user",
                                        email: "user@example.com",
                                        password: "password",
                                        password_confirmation: "password"}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end