class FavoriteMoviesByUsersController < ApplicationController
  def index 
    @user = User.find(3)
    @my_favorite_movies = @user.favorite_movies
  end

  def create
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    @user.favorite_movies << movie unless @user.favorite_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
