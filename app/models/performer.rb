class Performer < ActiveRecord::Base
  has_secure_password
  validates :username, :password, :email, :full_name, presence: true
  validates_uniqueness_of :username, :email
  validates :username, length: {minimum: 4}
  validates :password, length: {minimum: 8}
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :ratings
  has_many :gigs
  has_many :band_performers
  has_many :bands, through: :band_performers
end