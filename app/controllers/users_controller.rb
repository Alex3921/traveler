class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to "accounts/#{current_user.slug}"
    end
  end

  post '/signup' do
    binding.pry
    @current_user = User.create(params)

    if !@current_user.valid?
      flash[:message] = "Username and/or email already in use. Try again!"
      redirect to '/signup'
    else
      session[:user_id] = @current_user.id
      redirect to "accounts/#{@current_user.slug}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "accounts/#{@current_user.slug}"
    end
  end

  post '/login' do
    @current_user = User.find_by(username: params[:username], email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect "accounts/#{@current_user.slug}"
    else
      flash[:message] = "Whoopsie! Username & password don't match. Please try again!"
      erb :'users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You've logged out!"
      redirect to '/'
    else
      redirect to '/'
    end
  end
  
end