require 'test_helper'


include Devise::TestHelpers                          
include Warden::Test::Helpers
Warden.test_mode!

#user = FactoryGirl.create(:user)
#login_as(user, :scope => :user)
#user.confirmed_at = Time.now
#user.save

class PostsControllerTest < ActionController::TestCase
  # test "should get new" do
  #   get :new
  #   assert_response :success
  #   Warden.test_reset! 
  # end
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   Warden.test_reset! 
  # end
  # test "should get show" do
  #   get :show
  #   assert_response :success
  #  # Warden.test_reset! 
  # end
  # test "should get create" do
  #   get :create
  #   assert_response :success
  #  # Warden.test_reset! 
  # end
  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  #  # Warden.test_reset! 
  # end
  # test "should get update" do
  #   get :update
  #   assert_response :success
  #  # Warden.test_reset! 
  # end
  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  #  # Warden.test_reset! 
  # end
end

Warden.test_reset! 
