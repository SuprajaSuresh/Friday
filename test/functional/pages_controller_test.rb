require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get HOme" do
    get :HOme
    assert_response :success
  end

  test "should get Signin" do
    get :Signin
    assert_response :success
  end

  test "should get Signup" do
    get :Signup
    assert_response :success
  end

end
