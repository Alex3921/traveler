require_relative './concerns/slugifiable.rb'

class Attraction < ActiveRecord::Base
  belongs_to :location
  has_many :reviews
  has_many :users, through: :reviews
end