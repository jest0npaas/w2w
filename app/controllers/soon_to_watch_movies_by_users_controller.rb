class SoonToWatchMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @user.soon_to_watch_movies << movie unless @user.soon_to_watch_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
