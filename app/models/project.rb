class Project < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'

  attr_accessible :summary, :description

  validates :summary, :presence => true,
                      :length  => { :maximum => 160 }
end
