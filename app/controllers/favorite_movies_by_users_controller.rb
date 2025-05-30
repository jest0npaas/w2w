class FavoriteMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    # @my_favorite_movies = current_user.favorite_movies.order(created_at: :desc)
    @my_favorite_movies = current_user.favorite_movies_by_users
      .includes(:movie)
      .order(created_at: :desc)
      .map(&:movie)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @my_favorite_movies = current_user.favorite_movies
    @my_favorite_movies << @movie unless @my_favorite_movies.include?(@movie)
    redirect_to request.referer || movie_path(@movie), notice: "Movie added to favorite"
  end

  def destroy
    @movie = Movie.find_by(api_movie_id: params[:id])
    @my_favorite_movie = current_user.favorite_movies_by_users.find_by(movie_id: @movie.id)
    @my_favorite_movie.destroy if @my_favorite_movie
    redirect_to request.referer || movie_path(@movie), notice: "Movie removed from favorite"
  end
end
