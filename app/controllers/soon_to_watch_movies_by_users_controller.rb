class SoonToWatchMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies.order(created_at: :desc)
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies_by_users
    .includes(:movie)
    .map(&:movie)
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_soon_to_watch_movies << @movie unless @my_soon_to_watch_movies.include?(@movie)
    redirect_to request.referer || movie_path(@movie), notice: "Movie added to soon_to_watch"
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    current_user.soon_to_watch_movies.delete(@movie)
    redirect_to request.referer || movie_path(@movie), notice: "Movie removed from soon_to_watch"
  end

  # def destroy
  #   @movie = Movie.find_by(api_movie_id: params[:id])
  #   @my_soon_to_watch_movie = current_user.soon_to_watch_movies_by_users.find_by(movie_id: @movie.id)
  #   @my_soon_to_watch_movie.destroy if @my_favorite_movie
  #   redirect_to request.referer || movie_path(@movie), notice: "Movie removed from soon_to_watch"
  # end
end
