FactoryGirl.define do
	factory :event do
		name { Faker::Name.name }
		location { Faker::Address.street_address }
		event_time { Time.today - rand(10000) }
		deploy_time { Time.today + rand(10000) }
		desc { Faker::Lorem.sentence }

	end
end
