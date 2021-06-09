class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to "users/profiles/#{current_user.slug}"
    end
  end

  post '/signup' do
    binding.pry
  end
  
end