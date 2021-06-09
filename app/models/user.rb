require_relative './concerns/slugifiable.rb'

class User < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_secure_password
  
  has_many :reviews
  has_many :attractions, through: :reviews

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
end