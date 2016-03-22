class Performer < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates :password, length: {minimum: 8}
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :ratings
  has_many :gigs
  has_many :band_performers
  has_many :conversations
  has_many :messages
  has_one :band

  def Performer.performer_login(params)
    performer = find_by(email: params[:email])
    if performer && performer.authenticate(params[:password])
      return true
    else
      return false
    end
  end

end