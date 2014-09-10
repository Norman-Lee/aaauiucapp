class Officer < ActiveRecord::Base
  has_one :member
  has_one :chair

  validates :auth_token, uniqueness: true
end
