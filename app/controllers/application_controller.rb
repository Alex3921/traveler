require './config/environment'
require 'rack-flash'
require 'sinatra/base'
require 'sinatra/content_for'


class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    use Rack::Flash
    helpers Sinatra::ContentFor
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
    if !logged_in?
      redirect to '/login'
    end
    redirect to '/locations/index'
  end

  get "/about" do
    erb :about
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
        flash[:notice] = "Page not found! Please try again."
        redirect to "/locations"
      end
    end

    def has_img?(object)
      if object.img_url.empty?
        data = API.get_data(object.slug)["results"].sample
        photo = Photo.new(data)
        object.img_url = photo.full
        object.save
      end
    end

  end
end
