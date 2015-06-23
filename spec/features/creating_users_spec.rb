require 'spec_helper'

feature 'Create a user' do
	before do
		visit '/'
		click_link "Sign up now!"
	end
	
	scenario 'Create a user' do
		#fill_in "Name", with: "Steve"
		#fill_in "Email", with: "Steve@example.com"
		#fill_in "Password", with: "password"
		#fill_in "Confirmation", with: "password"
		#click_button "Create my account"
		#expect(page).to have_content("User has been created.")
	end

	scenario "Should create a valid user" do
		user = FactoryGirl.create(:user)
		user.should be_valid
	end

	scenario "Users should have name" do
		user = FactoryGirl.create(:user)
		user.name = ""  
		user.should_not be_valid
	end

	scenario "email should be present" do
		user = FactoryGirl.create(:user)
		user.email = ""
		user.should_not be_valid
	end

	scenario "name should not be too long" do
		user = FactoryGirl.create(:user)
		user.name = "a"*51
		user.should_not be_valid
	end

	scenario "email should not be too long" do
		user = FactoryGirl.create(:user)
		user.email = "a"*245+"example.com"
		user.should_not be_valid
	end

	scenario "email validation should accept valid addresses" do
		valid_addresses = %w[user@example.com USER@foo.com A_USER-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

		user = FactoryGirl.create(:user)
		valid_addresses.each do |va|
			user.email = va
			user.should be_valid
		end
	end
	
	scenario "email validation should reject invalid addresses" do
		valid_addresses = %w[user@example,com USER_at_foo.com user.name@example. foo@bar_baz.com foo@bar+baz.com]
		user = FactoryGirl.create(:user)
		valid_addresses.each do |va|
			user.email = va
			user.should_not be_valid
		end
	end

	scenario "email addresses should be unique" do
		user = FactoryGirl.create(:user)
		dup_user = user.dup
		dup_user.should_not be_valid
	end
end

