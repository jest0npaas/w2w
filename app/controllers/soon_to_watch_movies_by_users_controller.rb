class SoonToWatchMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies.order(created_at: :desc)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_soon_to_watch_movies << @movie unless @my_soon_to_watch_movies.include?(@movie)
    redirect_to request.referer || movie_path(@movie), notice: "Movie added to soon_to_watch"
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_soon_to_watch_movies.destroy(@movie)
    redirect_to request.referer || movie_path(@movie), notice: "Movie removed from favorite"
  end
end
