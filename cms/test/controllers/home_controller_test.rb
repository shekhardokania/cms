require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get testimonial" do
    get :testimonial
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end

end
