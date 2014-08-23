class Event < ActiveRecord::Base
  has_and_belongs_to_many :members
  has_and_belongs_to_many :chairs

  has_attached_file :cover_photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :event_photo, :styles => {:normal => "300x300>"}

  validates :name, presence: true


end
