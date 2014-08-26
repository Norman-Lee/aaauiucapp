FactoryGirl.define do
	factory :member do
		first_name { Faker::Name.first_name }
		last_name {Faker::Name.last_name}
		#class_standing {Faker::School.class_standing }
		e_mail { Faker::Internet.email }
		class_standing { Faker::Lorem.word }

	end
end