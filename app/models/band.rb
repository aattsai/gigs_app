class Band < ActiveRecord::Base
  has_many :ratings
  has_many :gigs
  has_many :band_performers
  has_many :performers, through: :band_performers
  belongs_to :performer
end