require 'test_helper'

class PostsControllerTest < ActionController::TestCase
#class PostControllerTest < ApplicationController

	def setup
		@post = posts(:dog_video)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Post.count' do
			post :create, post: { content: "I love oranges" }
		end
		assert_redirected_to login_url
	end

    test "should redirect destroy when not logged in" do
    	assert_no_difference 'Post.count' do
    		delete :destroy, id: @post
    	end
    	assert_redirected_to login_url
    end

    test "should redirect destroy for wrong post" do
    	log_in_as(users(:rujuta))
    	debugger
    	post = posts(:ants)
    	assert_no_difference 'Post.count' do
    		delete :destroy, id: post
    	end
    	assert_redirected_to root_url
    end
end

