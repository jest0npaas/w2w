class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = current_user.movies.all.order(created_at: :desc)
  end

  def show
    @movie = current_user.movies.find_by(api_movie_id: params[:id])
    @my_favorite_movies = current_user.favorite_movies
    @my_favorite_movie = current_user.favorite_movies_by_users.find_by(movie_id: @movie.id)
    @my_soon_to_watch_movies = current_user.soon_to_watch_movies
    @my_already_watched_movies = current_user.already_watched_movies

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
end
