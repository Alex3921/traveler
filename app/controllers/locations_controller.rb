class LocationsController < ApplicationController

  get '/locations' do
    @locations = Location.all
    erb :'locations/index'
  end

  get '/locations/new' do
    if logged_in?
      @current_user = User.find_by(id: session[:user_id])
      erb :'locations/new'
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  post '/locations' do
    if logged_in?
      if Location.new(params[:location]).valid?                 
        current_user.locations << Location.create(params[:location])
        flash[:notice] = "Location created successfully!"
        redirect to "/locations/#{Location.last.slug}"
      else
        flash[:notice] = "That name is taken. Please choose another one!"
        redirect to "/locations/new"
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  get '/locations/:slug' do
    @current_user = User.find_by(id: session[:user_id])
    @location = Location.find_by_slug(params[:slug])
    erb :'locations/show'
  end

  get '/locations/:slug/edit' do 
    if logged_in?
      @location = Location.find_by_slug(params[:slug])
      if @location && current_user.locations.include?(@location)
        erb :'locations/edit'
      else
        flash[:notice] = "Sorry, but you don't have permission to edit a location you didn't create."
        redirect to '/locations'
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  patch '/locations/:slug' do
    if logged_in?
      @location = Location.find_by_slug(params[:slug])
      if @location && current_user.locations.include?(@location)
        if @location.update(params[:location]) != true
          flash[:notice] = "The name is already taken. Please choose another one."
          redirect to "/locations/#{@location.slug}/edit"
        end
      else
        flash[:notice] = "Sorry, but you don't have permission to edit a location you didn't create."
        redirect to '/locations'
      end
      erb :'locations/show'
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end
  
end