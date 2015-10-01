require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@user = users(:pooja)
		@post = @user.posts.build(content: "How is your day")
	end

	test "Should be valid" do
		assert @post.valid?
	end

	test "User id should be present" do
		@post.user_id = nil
		assert_not @post.valid?
	end

	test "Content should be present" do
		@post.content = " "
		assert_not @post.valid?
	end


	test "Content should not be longer than 150 characters" do
		@post.content = 'a' * 151
		assert_not @post.valid?
	end

	test "order should be the most recent first" do
		assert_equal posts(:most_recent), Post.first
	end
end