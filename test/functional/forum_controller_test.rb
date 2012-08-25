require 'test_helper'

class ForumControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get viewforum" do
    get :viewforum
    assert_response :success
  end

  test "should get viewthread" do
    get :viewthread
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get memberlist" do
    get :memberlist
    assert_response :success
  end

end
