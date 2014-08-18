class Officer < ActiveRecord::Base
  has_one :member
  has_one :chair
end
