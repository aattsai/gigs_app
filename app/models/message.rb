class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :performer
  belongs_to :conversation
end