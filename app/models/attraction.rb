require_relative './concerns/slugifiable.rb'

class Attraction < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  belongs_to :location
  belongs_to :user
  has_many :reviews

  validates :name, uniqueness: { case_sensitive: false }
end