class Member < ActiveRecord::Base
  has_and_belongs_to_many :events

  validates :e_mail, presence: true, uniqueness: true
  validates_email_format_of :e_mail
end
