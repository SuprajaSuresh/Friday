class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  validates :content, presence: true

  def get_recent_two_likers(current_user)
  	user_ids = self.likes(:include => :user).collect(&:user_id).delete_if { |x| x == current_user.id }.last(2)
  	User.find(user_ids).map(&:username)
  end
end