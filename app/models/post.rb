class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
end
