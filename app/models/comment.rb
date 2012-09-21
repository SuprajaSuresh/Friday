class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates :post_id, :presence => true
  attr_accessible :body, :user_id, :post_id
end
