class AlreadyWatchedMoviesByUsersController < ApplicationController
  def index 
    @user = User.find(3)
    @my_already_watched_movies = @user.already_watched_movies
  end
  
  def create
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    @user.already_watched_movies << movie unless @user.already_watched_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
