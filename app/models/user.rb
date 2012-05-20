# -*- coding: utf-8 -*-
require 'digest'

class User < ActiveRecord::Base
  default_scope where(:active => true)
  
  has_many :projects, :foreign_key => 'owner_id'
  belongs_to :occupation
  has_one :mobli_profile
  has_many :user_roles
  has_many :roles, :through => :user_roles
  
  attr_reader :password
  attr_accessible :first_name, :last_name, :email, :title, :occupation_id,
                  :password, :password_confirmation, :photo

  validates :email, :presence   => true,
                    :format     => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    :uniqueness => { :case_sensitive => false }

  validates :first_name, :presence => true,
                         :length  => { :maximum => 50 }

  validates :last_name, :presence => true,
                        :length   => { :maximum => 50 }

  validates :password, :allow_blank  => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 },
                       :if           => :password_validation_required?

  #validates :linkedin_id, :uniqueness => true,
  #                    :allow_nil => true,
  #                    :allow_blank => true

  has_attached_file :photo,
    :url => "/logos/users/:id_:style.:extension",
    :default_url => "/logos/users/missing.png",
    :styles => {
      :thumb => '50x50',
    },
    :convert_options => {
      :thumb => "-background white -compose Copy -gravity center -extent 50x50",
    }

  def display_name
    name = first_name
    if last_name.present?
      name = name + ' ' + last_name
    end
    name
  end

  def to_s
    display_name
  end

  class << self
    def authenticate(email, password)
      if user = User.find_by_email(email)
        if user.hashed_password == User.hash_password(password, user.salt) &&
           user.active?
          user
        end
      end
    end

    def hash_password(password, salt)
      Digest::SHA2.hexdigest("#{salt}--#{password}")
    end
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password =
          self.class.hash_password(password, salt)
    end
  end

  def password_validation_required?
    hashed_password.blank? || !@password.blank?
  end

  def has_role(key)
    !roles.where(:key => key).empty?
  end

  def is_admin
    has_role('admin')
  end

private
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
