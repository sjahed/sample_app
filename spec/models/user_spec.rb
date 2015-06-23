require 'spec_helper'

describe User do
  
  	describe "passwords" do
  	  it "should be present(nonblank)" do
  	  	  user = User.new(name: "Steve", email:"steve@steve.com")
  	  	  user.save
  	  	  expect(user).to_not be_valid

  	  	  user.password = ""
  	  	  user.password_confirmation =""
  	  	  user.save
  	  	  expect(user).to_not be_valid
	  end

	  it "password and confirmation should match" do
	  	  user = User.create(name:"Steve", email:"steve@steve.com", password:"assword", password_confirmation:"pasword")
	  	  expect(user).to_not be_valid
	  end

	  it "should have a minimum length" do
	  	  user = User.new(name:"Steve", email:"steve@steve.com", password:"pad", password_confirmation:"pad")
	  	  expect(user).to_not be_valid
	  end
  end
end
