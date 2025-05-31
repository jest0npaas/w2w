class AlreadyWatchedMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_already_watched_movies = current_user.already_watched_movies
    @my_already_watched_movies_entries = current_user.already_watched_movies_by_users
    @my_already_watched_movies_latest = @my_already_watched_movies_entries
      .select("DISTINCT ON (movie_id) *")
      .order("movie_id, already_watched_movies_by_users.created_at DESC")
      .to_a
      .sort_by { |e| e.created_at }
      .reverse
    @watched_counts = @my_already_watched_movies.group(:movie_id).count
  end

  def create
    @movie = Movie.find(params[:movie_id])
    current_user.soon_to_watch_movies.delete(@movie)
    current_user.already_watched_movies_by_users.create!(
      already_watched_movies_by_users_params.merge(movie_id: @movie.id)
    )
    redirect_to request.referer || movie_path(@movie.api_movie_id), notice: "Movie moved to already_watched"
  end

  private

  def already_watched_movies_by_users_params
    params.require(:already_watched_movies_by_user).permit(:personal_rating, :remarks)
  end
end
