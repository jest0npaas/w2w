class UsersController < ApplicationController  
  def show
    @user = User.find(params[:id])
    @favorite_movies = @user.favorite_movies
    @soon_to_watch_movies = @user.soon_to_watch_movies
    @already_watched_movies = @user.already_watched_movies
  end
end
