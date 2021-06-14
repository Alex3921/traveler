class LocationsController < ApplicationController

  get '/locations' do
    @locations = Location.all

    erb :'locations/index'
  end

  get '/locations/new' do
    redirect_login
    @current_user = User.find_by(id: session[:user_id])

    erb :'locations/new'
  end

  post '/locations' do
    redirect_login
    if !Location.new(params[:location]).valid?                 
      flash[:notice] = "That name is taken. Please choose another one!"
      redirect to "/locations/new"
    end
    
    current_user.locations << Location.create(params[:location])
    flash[:notice] = "Location created successfully!"
    redirect to "/locations/#{Location.last.slug}"
  end

  get '/locations/:slug' do
    @current_user = User.find_by(id: session[:user_id])
    @location = Location.find_by_slug(params[:slug])
    record_found?([@location])

    erb :'locations/show'
  end

  get '/locations/:slug/edit' do 
    redirect_login
    @location = Location.find_by_slug(params[:slug])
    record_found?([@location])
    current_user_has_location?(@location)
    
    erb :'locations/edit'
  end

  patch '/locations/:slug' do
    redirect_login
    @location = Location.find_by_slug(params[:slug])
    current_user_has_location?(@location)

    if @location.update(params[:location]) != true
      flash[:notice] = "The name is already taken. Please choose another one."
      redirect to "/locations/#{@location.slug}/edit"
    end

    erb :'locations/show'
  end

  helpers do
    def current_user_has_location?(location)
      if !@location && current_user.locations.include?(@location)
        flash[:notice] = "Sorry, but you don't have permission to edit a location you didn't create."
        redirect to '/locations'
      end
    end

  end
end