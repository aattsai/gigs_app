class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates :password, length: {minimum: 8}
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :ratings
  has_many :gigs
  has_many :conversations
  has_many :messages

  mount_uploader :avatar, AvatarUploader


  def User.user_login(params)
    user = find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      return true
    else
      return false
    end
  end

end
