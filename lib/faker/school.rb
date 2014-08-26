module Faker
	class School < Base
		class << self
			def class_standing
				fetch('school.class_standing')
			end
		end
	end
end