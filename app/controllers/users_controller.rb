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
      flash[:message] = "Successfully logged in!"
      redirect "accounts/#{@current_user.slug}"
    else
      flash[:message] = "Whoopsie! Username & password don't match. Please try again!"
      erb :'users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "Successfully logged out!"
      redirect to '/'
    else
      redirect to '/'
    end
  end
  
  get 'accounts/:slug' do
    @current_user = User.find_by(id: session[:user_id])

    if logged_in? && @current_user.slug == params[:slug]
      erb :'users/accounts/show'
    else
      flash[:notice] = "You need to log in first!"
      redirect to '/login'
    end
  end

  get 'accounts/:slug/edit' do
    @current_user = User.find_by(id: session[:user_id])

    if logged_in? && @current_user.slug == params[:slug]
      erb :'users/accounts/edit'
    else
      flash[:notice] = "You're being naughty!!!"
      redirect to '/'
    end
  end

  patch 'accounts/:slug' do
    if logged_in?
      @current_user = User.find_by(id: session[:user_id])
      if @current_user.slug == params[:slug]
        @current_user.update(params)
      else
        flash[:notice] = "You don't have permission to edit this profile!"
        erb :"accounts/#{@current_user.slug}"
      end
    else
      redirect to '/login'
    end
  end

  delete 'accounts/:slug' do
    if logged_in?
      @current_user = User.find_by(id: session[:user_id])
      if @current_user.slug == params[:slug]
        @current_user.delete
        flash[:notice] = "Account has been deleted!"
        redirect to '/'
      else
        flash[:notice] = "Not allowed!!"
        redirect to "/accounts/#{@current_user.slug}"
      end
    else
      redirect to '/login'
    end
  end
end