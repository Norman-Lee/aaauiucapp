FactoryGirl.define do
	factory :officer do
		username { Faker::Internet.user_name }
		salted_password { Faker::Internet.password }
		start_date { Date.today-rand(10000) }
		end_date { Date.today+rand(10000) }
	end
end 