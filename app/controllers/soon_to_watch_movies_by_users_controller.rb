class SoonToWatchMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies_by_users
    .order(created_at: :asc)
    .includes(:movie)
    .map(&:movie)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_soon_to_watch_movies << @movie unless @my_soon_to_watch_movies.include?(@movie)
    redirect_to request.referer || movie_path(@movie.api_movie_id), notice: "Movie added to soon_to_watch"
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    current_user.soon_to_watch_movies.delete(@movie)
    redirect_to request.referer || movie_path(@movie.api_movie_id), notice: "Movie removed from soon_to_watch"
  end
end
