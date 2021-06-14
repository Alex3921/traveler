class ReviewsController < ApplicationController
  
  get '/reviews/:slug/add_review' do
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])

    erb :'reviews/new'
  end

  post '/reviews/:slug' do
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])
    @review = Review.create(content: params[:review][:content], rating: params[:review][:rating].to_i)
    current_user.reviews << @review
    @attraction.reviews << @review

    redirect to "/attractions/#{@attraction.slug}"
  end

  get '/reviews/:slug/:id/edit' do 
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])
    @review = Review.find_by(id: params[:id])
    record_found?([@attraction, @review])

    if !@review.user == current_user
      flash[:notice] = "Permission denied!"
      redirect to "/attractions/#{@attraction.slug}"
    end

    erb :'reviews/edit'
  end

  patch '/reviews/:slug/:id' do
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])
    @review = Review.find(params[:id])

    if !@attraction && @review.user == current_user
      flash[:notice] = "Permission denied!"
      redirect to "/attractions/#{@attraction.slug}"
    end

    @review.update(params[:review])
    flash[:notice] = "Updated, successfully."
    redirect to "/attractions/#{@attraction.slug}"
  end

  delete '/reviews/:slug/:id' do
    redirect_login
    @attraction = Attraction.find_by_slug(params[:slug])
    @review = Review.find(params[:id])

    if !@review.user == current_user
      flash[:notice] = "Forbidden! Permission denied."
      redirect to "/attractions/#{@attraction.slug}"
    end

    @review.delete
    flash[:notice] ="Review deleted successfully!"
    redirect to "/attractions/#{params[:slug]}"
  end
end