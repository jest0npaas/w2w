class AlreadyWatchedMoviesByUsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    @my_already_watched_movies = current_user.already_watched_movies.order(created_at: :desc)
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    current_user.soon_to_watch_movies.delete(@movie)
    current_user.already_watched_movies_by_users.create!(
      already_watched_movies_by_users_params.merge(movie_id: @movie.id)
    )
    redirect_to request.referer || movie_path(@movie), notice: "Movie moved to already_watched"
  end

  private

  def already_watched_movies_by_users_params
    params.require(:already_watched_movies_by_user).permit(:personal_rating, :remarks)
  end

end
