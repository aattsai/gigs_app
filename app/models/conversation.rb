class Conversation < ActiveRecord::Base

  belongs_to :user
  belongs_to :performer
  has_many :messages
  
end