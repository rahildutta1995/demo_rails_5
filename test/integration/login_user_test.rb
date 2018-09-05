require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login invalid user" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path,params: {sessions: {email: "",password: ""}}
  	assert_template 'sessions/new'
  	get root_path
  end 
end
