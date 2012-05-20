class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :message

  validates :message, :presence => true
end
