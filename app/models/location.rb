require_relative './concerns/slugifiable.rb'

class Location < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :attractions
  belongs_to :user

  validates :name, uniqueness: { case_sensitive: false }
end