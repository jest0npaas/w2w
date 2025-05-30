class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = current_user.movies.all.order(created_at: :desc)
  end

  def show
    @movie = Movie.find_by(api_movie_id: params[:id])

    unless @movie
      redirect_to request.referer || search_path, alert: "Movie not found"
      return
    end

    load_show_data

    if @movie.api_rating.blank?
      # real API call
      details = MovieApi.get_movies_by_id(@movie.api_movie_id)

      # mock API data call
      # file_path = Rails.root.join("lib", "assets", "search_id.json")
      # details = JSON.parse(File.read(file_path))

      # add rating to movie object
      @movie.update(
        api_rating: details["Ratings"].first["Value"]
      )
    end
  end
  
  private

  def load_show_data
    @my_favorite_movies = current_user.favorite_movies
    @my_favorite_movie = current_user.favorite_movies_by_users.find_by(movie_id: @movie.id)
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_soon_to_watch_movie = current_user.soon_to_watch_movies_by_users.find_by(movie_id: @movie.id)
    @my_already_watched_movies = current_user.already_watched_movies
    @my_already_watched_movie = current_user.already_watched_movies_by_users.find_by(movie_id: @movie.id)
  end
end
