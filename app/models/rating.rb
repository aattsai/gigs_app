class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :performer
  belongs_to :band
end