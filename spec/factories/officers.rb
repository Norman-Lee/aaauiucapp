# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :officer do
  	username {Faker::Internet.user_name}
  	password { "12345678"}
  	start_date { Date.today-rand(10000) }
  	end_date { Date.today+rand(10000) }
  	email { Faker::Internet.email}
  end
end
