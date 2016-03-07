class BandPerformer < ActiveRecord::Base
  belongs_to :band
  belongs_to :performer
end