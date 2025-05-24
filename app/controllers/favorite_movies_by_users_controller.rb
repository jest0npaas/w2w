class FavoriteMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    @my_favorite_movies = current_user.favorite_movies
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @user.favorite_movies << movie unless @user.favorite_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
