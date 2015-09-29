require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do
  describe "GET /users_edits" do
    it "test for unsuccessful edit" do
      get users_edits_path
      #expect(response).to have_http_status(200)
      assert_template 'users/edit'
      patch user_path(@user), user: { name: "",
                                       email: "foo@invalid",
                                       password: "foo",
                                       password_confirmation: "bar" }
      assert_template 'users/edit'                                 

    end
  end
end
