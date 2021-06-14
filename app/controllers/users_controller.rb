class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/accounts/#{current_user.slug}"
    end
      
    erb :'/users/signup'
  end

  post '/signup' do
    @current_user = User.create(params[:user])

    if !@current_user.valid?
      flash[:notice] = "Username and/or email already in use. Try again!"
      redirect to '/signup'
    end

    session[:user_id] = @current_user.id
    redirect to "/accounts/#{@current_user.slug}"
  end

  get '/login' do
    if logged_in?
      redirect to "/accounts/#{@current_user.slug}"
    end
    
    erb :'users/login'
  end

  post '/login' do
    @current_user = User.find_by(username: params[:user][:username])
    if !(@current_user && @current_user.authenticate(params[:user][:password]))
      flash[:notice] = "Whoopsie! Username & password don't match. Please try again!"
      redirect to '/login'
    end

    session[:user_id] = @current_user.id
    flash[:notice] = "Successfully logged in!"
    redirect "/accounts/#{@current_user.slug}"
  end

  get '/logout' do
    if !logged_in?
      redirect to '/'
    end

    session.clear
    flash[:notice] = "Successfully logged out!"
    redirect to '/'
  end
  
  get '/accounts/:slug' do
    redirect_login
    @current_user = User.find_by(id: session[:user_id])

    if !@current_user.slug == params[:slug]
      flash[:notice] = "You're being naughty!!!"
      redirect to "/accounts/#{@current_user.slug}"
    end

    erb :'users/accounts/show'
  end

  get '/accounts/:slug/edit' do
    redirect_login
    @current_user = User.find_by(id: session[:user_id])

    if !@current_user.slug == params[:slug]
      flash[:notice] = "You're being naughty!!!"
      redirect to "/accounts/#{@current_user.slug}"
    end

    erb :'users/accounts/edit'
  end

  patch '/accounts/:slug' do
    redirect_login
    @current_user = User.find_by(id: session[:user_id])
    
    if !@current_user.slug == params[:slug]
      flash[:notice] = "You don't have permission to edit this profile!"
      erb :"accounts/#{@current_user.slug}"
    end

    @current_user.update(params[:user])
    redirect to "/accounts/#{@current_user.slug}"
  end

  delete '/accounts/:slug' do
    redirect_login
    @current_user = User.find_by(id: session[:user_id])
    
    if @current_user.slug == params[:slug]
      flash[:notice] = "Not allowed!!"
      redirect to "/accounts/#{@current_user.slug}"
    end

    @current_user.delete
    flash[:notice] = "Account has been deleted!"
    redirect to '/'
  end
end