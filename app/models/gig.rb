class Gig < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  belongs_to :performer
end