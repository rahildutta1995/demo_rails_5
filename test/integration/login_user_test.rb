require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:Rahil)    
  end

  test "login invalid user" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path,params: {sessions: {email: "",password: ""}}
  	assert_template 'sessions/new'
  	get root_path
  end 

  test "valid user login" do 
    get login_path
    post login_path,params: {sessions: {email: @user.email ,password: 'password'}}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end 

  test "login with valid user and valid logging out" do 
    get login_path
    post login_path,params: {sessions: {email: @user.email ,password: 'password'}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]",login_path,count: 0
    assert_select "a[href=?]",logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]",login_path
    assert_select "a[href=?]",logout_path,count: 0
    assert_select "a[href=?]", user_path(@user),count: 0
  end
end
