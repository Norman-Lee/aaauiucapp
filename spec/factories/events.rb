FactoryGirl.define do
	factory :event do
		name { Faker::Name.name }
		location { Faker::Address.street_address }
		event_time { Time.at(rand * Time.now.to_i) }
		deploy_time { Time.at(rand * Time.now.to_i) }
		desc { Faker::Lorem.sentence }

	end
end
