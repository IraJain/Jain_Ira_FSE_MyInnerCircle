class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user

  validates_numericality_of :friend_id, :greater_than => 0, :message => " is not a member of MyCircle"
  validates_uniqueness_of :friend_id, :scope => [:user_id], :message => "already in your friend list"

end
