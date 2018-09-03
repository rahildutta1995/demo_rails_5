require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title" , "Home"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title" , "Help"
  end
  test "static_pages_about_url" do 
  	get static_pages_about_url
  	assert_response :success
    assert_select "title" , "About"
  end

  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end
end