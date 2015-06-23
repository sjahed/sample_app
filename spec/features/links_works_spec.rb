require 'spec_helper'

feature "Links on HOME Page works" do
	before do
		visit '/'
	end

	scenario "Sample App link takes to Home page" do
		click_link "sample app"
		expect(page.current_url).to eql(root_url)
	end

	scenario "Help link takes to help page" do
		click_link "Help"
		expect(page.current_url).to eql(help_url)
	end

	scenario "About link takes to About page" do
		click_link "About"
		expect(page.current_url).to eql(about_url)
	end

	scenario "Contact link takes to Contact page" do
		click_link "Contact"
		expect(page.current_url).to eql(contact_url)
	end
	
	scenario 'Sign up link works' do
		click_link 'Sign up'
		expect(page.current_url).to eql(signup_url)
	end
end

