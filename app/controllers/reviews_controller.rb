class ReviewsController < ApplicationController
  
  get 'attractions/:slug/add_review' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      erb :'reviews/new'
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  post 'attractions/:slug/reviews' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      @review = Review.create(content: params[:review])
      current_user.reviews << @review
      @attraction.reviews << @review
      
      redirect to "/attractions/#{@attraction.slug}"
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  get '/attractions/:slug/review_edit/:id' do 
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      @review = Review.find_by(params[:id])
      if @review.user == current_user
        erb :'reviews/edit'
      else
        flash[:notice] = "Permission denied!"
        redirect to "/attractions/#{@attraction.slug}"
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  patch 'attractions/:slug/reviews/:id' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      @review = Review.find_by(params[:id])
      if @attraction && @review.user == current_user
        flash[:notice] = "Updated, successfully."
        redirect to "/attractions/#{@attraction.slug}"
      else
        flash[:notice] = "Permission denied!"
        redirect to "/attractions/#{@attraction.slug}"
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end

  delete 'attractions/:slug/reviews/:id' do
    if logged_in?
      @attraction = Attraction.find_by_slug(params[:slug])
      @review = Review.find_by(params[:id])
      if @review.user == current_user
        @review.delete
        flash[:notice] ="Review deleted successfully!"
        redirect to '/reviews'
      else
        flash[:notice] = "Forbidden! Permission denied."
        redirect to "/attractions/#{@attraction.slug}"
      end
    else
      flash[:notice] ="Forbidden! Please login first!"
      redirect to '/login'
    end
  end
end