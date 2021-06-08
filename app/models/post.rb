require_relative './concerns/slugifiable.rb'

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
end