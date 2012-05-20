class Project < ActiveRecord::Base
  default_scope where(:active => true)
  
  belongs_to :owner, :class_name => 'User'
  has_many :follows
  has_many :comments
  has_many :project_tags
  has_many :tags, :through => :project_tags

  attr_accessible :summary, :description

  validates :summary, :presence => true,
                      :length  => { :maximum => 160 }

  has_attached_file :photo,
    :url => '/logos/projects/:id_:style.:extension',
    :default_url => '/logos/projects/missing.png',
    :styles => {
      :thumb => '32x32',
      :large => '70x70'
    },
    :convert_options => {
      :thumb => '-background white -compose Copy -gravity center -extent 32x32',
      :large => '-background white -compose Copy -gravity center -extend 70x70'
    }
end
