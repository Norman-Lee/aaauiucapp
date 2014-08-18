class Chair < ActiveRecord::Base
  has_many :officers
  has_and_belongs_to_many :events
end
