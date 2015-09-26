require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "this should nto work because of the invalide email" do
      get signup_path
      assert_no_difference 'User.count' do
      	post_users_path, user: { name: " ", email: "user@invalid", password: "qwerty123", password_confirmation: "qwerty123" }
    end
    asser_templte 'users/new'
  end

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "thsi should submit the user" do
      get signup_path
      assert_no_difference 'User.count' do
      	post_users_path, user: { name: "user", email: "user@gmail.com", password: "qwerty123", password_confirmation: "qwerty123" }
    end
    asser_templte 'users/new'
  end


end
