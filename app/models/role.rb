class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, :through => :user_roles

  attr_accessible :key, :name

  validates :key, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
end
