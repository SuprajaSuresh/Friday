class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user
  belongs_to :friend, :class_name => 'User' 
  
  validates  :user_id, :uniqueness => {:scope => :friend_id}
end
