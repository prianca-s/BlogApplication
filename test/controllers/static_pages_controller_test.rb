require 'test_helper'

include Devise::TestHelpers                          
include Warden::Test::Helpers
Warden.test_mode!

#user = FactoryGirl.create(:user)
#login_as(user, :scope => :user)
#user = FactoryGirl.create(:user)
#login_as(user, :scope => :user)
#user.confirmed_at = Time.now
#user.save

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get home" do	
    get :home
    assert_response :success
 #   Warden.test_reset! 
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end



end
