require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title" , "Home"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title" , "Help"
  end
  test "should get about" do 
  	get about_path
  	assert_response :success
    assert_select "title" , "About"
  end

  test "should get root" do
    get home_path
    assert_select "a[href=?]",about_path, count: 2
    assert_select "div.intro" 
    assert_response :success
  end
end