class SoonToWatchMoviesByUsersController < ApplicationController
  def index 
    @user = User.find(3)
    @my_soon_to_watch_movies = @user.soon_to_watch_movies
  end
  
  def create
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    @user.soon_to_watch_movies << movie unless @user.soon_to_watch_movies.include?(@movie)
    redirect_to user_path(user)
  end
end
