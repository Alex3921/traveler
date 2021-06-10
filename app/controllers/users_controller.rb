class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to "/accounts/#{current_user.slug}"
    end
  end

  post '/signup' do
    @current_user = User.create(params[:user])

    if !@current_user.valid?
      flash[:notice] = "Username and/or email already in use. Try again!"
      redirect to '/signup'
    else
      session[:user_id] = @current_user.id
      redirect to "/accounts/#{@current_user.slug}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/accounts/#{@current_user.slug}"
    end
  end

  post '/login' do
    @current_user = User.find_by(username: params[:user][:username], email: params[:user][:email])
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      flash[:notice] = "Successfully logged in!"
      redirect "/accounts/#{@current_user.slug}"
    else
      flash[:notice] = "Whoopsie! Username & password don't match. Please try again!"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:notice] = "Successfully logged out!"
      redirect to '/'
    else
      redirect to '/'
    end
  end
  
  get '/accounts/:slug' do
    @current_user = User.find_by(id: session[:user_id])
    if logged_in?
      if @current_user.slug == params[:slug]
        erb :'users/accounts/show'
      else
        flash[:notice] = "You're being naughty!!!"
        redirect to "/accounts/#{@current_user.slug}"
      end
    else
      flash[:notice] = "You need to log in first!"
      redirect to '/login'
    end
  end

  get '/accounts/:slug/edit' do
    @current_user = User.find_by(id: session[:user_id])
    if logged_in?
      if @current_user.slug == params[:slug]
        erb :'users/accounts/edit'
      else
        flash[:notice] = "You're being naughty!!!"
        redirect to "/accounts/#{@current_user.slug}"
      end
    else
      flash[:notice] = "You need to log in first!"
      redirect to '/login'
    end
  end

  patch '/accounts/:slug' do
    if logged_in?
      @current_user = User.find_by(id: session[:user_id])
      if @current_user.slug == params[:slug]
        @current_user.update(params[:user])
        redirect to "/accounts/#{@current_user.slug}"
      else
        flash[:notice] = "You don't have permission to edit this profile!"
        erb :"accounts/#{@current_user.slug}"
      end
    else
      redirect to '/login'
    end
  end

  delete '/accounts/:slug' do
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