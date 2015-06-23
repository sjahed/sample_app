FactoryGirl.define do
	factory :user do
		name "Steve"
		email "Steve@example.com"
		password "password"
		password_confirmation "password"
	end
end
