class AttractionsController < ApplicationController

  get '/attractions' do
    @attractions = Attraction.all
    erb :'attractions/index'
  end

  get '/attractions/new' do
    @current_user = User.find_by(id: session[:user_id])
    if logged_in?
      erb :'attractions/new'
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  post '/attractions' do
    if logged_in?
      if Attraction.new(params[:attraction]).valid?                 
        current_user.attractions << Attraction.create(params[:attraction])
        flash[:notice] = "Attraction created successfully!"
        redirect to "/attractions/#{current_user.slug}"
      else
        flash[:notice] = "That name is taken. Please choose another one!"
        redirect to "/attractions/new"
      end
    end
  end

  get '/attractions/:slug' do
    @current_user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by_slug(params[:slug])
    erb :'attractions/show'
  end

  get '/attractions/:slug/edit' do 
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      if @attraction && @attraction.user == current_user
        erb :'attractions/edit'
      else
        flash[:notice] = "Sorry, but you don't have permission to edit an attraction you didn't create."
        redirect to '/attractions'
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  patch '/attractions/:slug' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      if @attraction && @attraction.user == current_user
        if @attraction.update(params[:attraction]) != true
          flash[:notice] = "The name is already taken. Please choose another one."
          redirect to '/attractions/new'
        end
      else
        flash[:notice] = "Sorry, but you don't have permission to edit an attraction you didn't create."
        redirect to '/attractions'
      end
      erb :'attractions/show'
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  delete '/attractions/:slug' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      if @attraction.user.id == current_user.id
        @attraction.delete
        flash[:notice] ="Attraction deleted successfully!"
        redirect to '/attractions'
      else
        flash[:notice] = "Forbidden! Permission denied."
        redirect to '/attractions'
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end
end
