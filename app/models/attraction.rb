require_relative './concerns/slugifiable.rb'

class Attraction < ActiveRecord::Base
  belongs_to :location
  has_many :reviews
  belongs_to :user

  validates :name, uniqueness: { case_sensitive: false }
end