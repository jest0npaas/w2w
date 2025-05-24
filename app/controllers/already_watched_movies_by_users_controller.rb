class AlreadyWatchedMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    @my_already_watched_movies = current_user.already_watched_movies
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @user.already_watched_movies << movie unless @user.already_watched_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
