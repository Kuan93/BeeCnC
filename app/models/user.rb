class User < ActiveRecord::Base
  include Clearance::User
  
  validates :name, presence:true
  validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid password format"}
  validates :password, presence: true, length: { minimum: 6 , message: "Password must have a minimum length of 6 characters."}


  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :amenities, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)      
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
  	true
  end

end
