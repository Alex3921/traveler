require_relative './concerns/slugifiable.rb'

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
end