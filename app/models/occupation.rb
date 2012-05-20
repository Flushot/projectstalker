class Occupation < ActiveRecord::Base
  has_many :users

  attr_accessible :name

  validates :name, :presence => true
end
