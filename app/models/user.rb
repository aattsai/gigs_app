class User < ActiveRecord::Base
  has_secure_password
  validates :username, :password, :email, :full_name, presence: true
  validates_uniqueness_of :username, :email
  validates :username, length: {minimum: 4}
  validates :password, length: {minimum: 8}
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :ratings
  has_many :gigs

  def User.user_login(params)
    user = find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      return true
    else
      return false
    end
  end

end
