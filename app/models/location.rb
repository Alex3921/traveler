require_relative './concerns/slugifiable.rb'

class Location < ActiveRecord::Base
  has_many :attractions
end