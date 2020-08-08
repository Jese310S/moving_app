require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def setup
    @user = User.new
    @listing = Listing.new(comment: "Lorem Ipsum", user_id: @user.id)
  end

  # test "should be valid" do
  #   assert @listing.valid?
  # end
    
  test "user id should be present" do
    @listing.user_id = nil
    assert_not @listing.valid?
  end

  test "order should be most recent first" do
  assert_equal listings(:most_recent), Listing.first
  end

end
