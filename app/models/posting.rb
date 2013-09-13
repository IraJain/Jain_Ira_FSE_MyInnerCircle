class Posting < ActiveRecord::Base
  attr_accessible :description, :location, :phone, :title, :user_id
  belongs_to :user

  validates :title, presence:  true
  validates :description, presence:  true
  validates_length_of :title , maximum: 350

end
