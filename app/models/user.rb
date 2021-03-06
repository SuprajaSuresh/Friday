class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :friendships  
  has_many :friends, :through => :friendships  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  attr_accessible :dob, :email, :fullname, :gender, :password, :username, :password_confirmation, :pic
  
  has_secure_password
  has_attached_file :pic, :styles => 
     { :medium => "300x300>", :thumb => "100x100>" }

  before_create :create_remember_token

  validates :username, presence: true, length: { maximum: 15 },
            uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :dob,
  :date => {:before => Date.today, :message => 'must be before today'}   
  def already_likes?(post)
      self.likes.find(:all, :conditions => ['post_id = ?', post.id]).size > 0
  end
  private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end 
  
end 