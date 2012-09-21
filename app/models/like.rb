class Like < ActiveRecord::Base
  
  attr_accessible :user_id, :post_id
  belongs_to :user
  belongs_to :post
  
  validates :post_id, :presence => true
  validates :user_id , :uniqueness => {:scope => :post_id}
 
end
