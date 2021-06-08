require_relative './concerns/slugifiable.rb'

class Attraction < ActiveRecord::Base
  belongs_to :location
  has_many :posts
  has_many :users, through: :posts
end