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
    :url => "/logos/projects/:id_:style.:extension",
    :default_url => "/logos/projects/missing.png",
    :styles => {
      :thumb => '50x50',
    },
    :convert_options => {
      :thumb => "-background white -compose Copy -gravity center -extent 50x50",
    }
end
