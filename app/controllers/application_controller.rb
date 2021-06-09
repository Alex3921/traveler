require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, 'abcdefghijklmnopqrstuvwxyz'
  end


  get "/" do
    erb :index
  end

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

  end

end
