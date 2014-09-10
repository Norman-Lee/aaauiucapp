FactoryGirl.define do
	factory :officer do
		username { Faker::Internet.user_name }
		salted_password { Faker::Internet.password(8) }
		start_time { Date.today-rand(10000) }
		end_time { Date.today+rand(10000) }
	end
end 