require_relative './concerns/slugifiable.rb'

class Location < ActiveRecord::Base
  has_many :attractions

  validates :name, uniqueness: { case_sensitive: false }
end