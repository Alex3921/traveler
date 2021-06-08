require_relative './concerns/slugifiable.rb'

class User < ActiveRecord::Base
  has_many :posts
  has_many :attractions, through: :posts
end