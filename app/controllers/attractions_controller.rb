class AttractionsController < ApplicationController

  get '/attractions' do
    @attractions = Attraction.all
    erb :'attractions/index'
  end

  get '/attractions/new' do
    redirect_login
    @locations = Location.all
    @current_user = User.find_by(id: session[:user_id])
    erb :'attractions/new'     
  end

  post '/attractions' do
    redirect_login
    if !Attraction.new(params[:attraction]).valid?                 
      flash[:notice] = "That name is taken. Please choose another one!"
      redirect to "/attractions/new"
    end

    @location = Location.find(params[:location][:id])
    @attraction = Attraction.create(params[:attraction])
    has_img?(@attraction)
    current_user.attractions << @attraction
    @attraction.location = @location
    flash[:notice] = "Attraction created successfully!"
    redirect to "/attractions/#{Attraction.last.slug}"
  end

  get '/attractions/:slug' do
    @current_user = User.find_by(id: session[:user_id])
    if !!(@attraction = Attraction.find_by_slug(params[:slug])) != true
      redirect to '/attractions'
    end

    erb :'attractions/show'
  end

  get '/attractions/:slug/edit' do 
    redirect_login
    if !!(@attraction = Attraction.find_by_slug(params[:slug])) != true
      redirect to '/attractions'
    end 

    if !(@attraction && @attraction.user == current_user)
      flash[:notice] = "Sorry, but you don't have permission to edit an attraction you didn't create."
      redirect to '/attractions'
    end
      
    erb :'attractions/edit'
  end

  patch '/attractions/:slug' do
    redirect_login
    params[:attraction][:description].strip
    @attraction = Attraction.find_by_slug(params[:slug])
    if !@attraction && @attraction.user == current_user
      flash[:notice] = "Sorry, but you don't have permission to edit an attraction you didn't create."
      redirect to '/attractions'
    end

    if @attraction.update(params[:attraction]) != true
      flash[:notice] = "The name is already taken. Please choose another one."
      redirect to '/attractions/new'
    end

    erb :'attractions/show'
  end

  delete '/attractions/:slug' do
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])
    if !@attraction.user.id == current_user.id
      flash[:notice] = "Forbidden! Permission denied."
      redirect to '/attractions'
    end
    
    @attraction.delete
    flash[:notice] ="Attraction deleted successfully!"
    redirect to '/attractions'
  end
end
