require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do 
  	get sign_up_path
  	assert_no_difference 'User.count' do
  		post users_path	,params: {user:{name: "",email: "asdas.com" , password: "test1234" ,confirmation_password: "test1234"}}
  	end
  	assert_template 'users/new'
  end 
end
