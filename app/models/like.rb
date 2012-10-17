class Like < ActiveRecord::Base
  
  attr_accessible :user_id, :post_id
  belongs_to :usergm
  belongs_to :post
  validates :user_id , :uniqueness => {:scope => :post_id}

end
