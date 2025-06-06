require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
  @user = users(:michael)
  # This code is not idiomatically correct.
  @micropost =@user.microposts.create(content: "Lorem ipsum")
  # @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do assert @micropost.valid?
  end
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  # test "order should be most recent first" do
  #   @user.save
  #   older_post = @user.microposts.create!(content: "Old post", created_at: 1.day.ago)
  #   newer_post = @user.microposts.create!(content: "New post", created_at: 1.hour.ago)

  #   assert_equal [newer_post, older_post], Micropost.all.to_a
  # end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
