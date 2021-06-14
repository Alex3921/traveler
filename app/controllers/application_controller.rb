require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
    # set :show_exceptions, false
  end


  # not_found do
  #   status 404
  #   redirect to '/'
  # end

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

    def redirect_login
      if !logged_in?
        flash[:notice] ="Forbidden! Please login first!"
        redirect to '/login'
      end
    end

    def record_found?(resources)
      res = resources.map{|obj| obj.nil?}
      if res.any?(true)
        flash[:notice] = "Please try again."
        redirect to "/locations"
      end
    end

  end
end
