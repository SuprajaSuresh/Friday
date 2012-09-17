class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :dob, :email, :fullname, :gender, :password, :username, :password_confirmation
  has_secure_password

  before_save :create_remember_token

  validates :username, presence: true, length: { maximum: 15 },
            uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :dob,
            :date => {:before => Date.today, 
            :after => Date.today - 100.year, :message => 'is invalid'}
            
private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end