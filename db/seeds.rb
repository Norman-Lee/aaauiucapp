# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def fill_chairs()
  Chair.create(chair_type: 'President')
  Chair.create(chair_type: 'External Vice President')
  Chair.create(chair_type: 'Internal Vice President')
  Chair.create(chair_type: 'Treasurer')
  Chair.create(chair_type: 'Secretary')
  Chair.create(chair_type: 'Academic Alumni')
  Chair.create(chair_type: 'Big Sib Lil Sib')
  Chair.create(chair_type: 'Cultural Awareness')
  Chair.create(chair_type: 'Fashion Show Head Coordinator')
  Chair.create(chair_type: 'Fundraising')
  Chair.create(chair_type: 'Outreach')
  Chair.create(chair_type: 'Philanthropy')
  Chair.create(chair_type: 'Public Relations')
  Chair.create(chair_type: 'Social')
  Chair.create(chair_type: 'Sports')
end

Member.create(first_name: 'Norman', last_name: 'Lee', class_standing: 'Old Balls', sex: 'Male', e_mail: 'yoloswag420@gmail.com', attendance_level: 1)
Event.create(name: 'BobAAA', location: 'Quad', event_time: DateTime.parse("08/03/2014 11:00"), desc: 'Get your Boba at the quad! Comes in three different flavors', deploy_time: DateTime.parse("08/05/2014 23:59"))

fill_chairs

outreach_id=Chair.find_by_chair_type('Outreach').id

Officer.create(username: 'DaRealNormanLee', salted_password: 'password', chair_id: outreach_id, start_date: DateTime.parse("08/10/2014"), end_date: DateTime.parse("05/10/2015"))

@Outreach = Officer.find(1)
@Outreach_chair = Chair.find(11)

@Outreach_chair.events << Event.find(1)



