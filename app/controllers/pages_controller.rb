class PagesController < ApplicationController
  def index
  end

  def search
  end

  def results
    # real API call
    # @movies = MovieApi.get_movies_by_title(params[:query])["Search"]

    # mock API data call
    file_path = Rails.root.join("lib", "assets", "search.json")
    @movies = JSON.parse(File.read(file_path))["Search"]

    if user_signed_in?
      @movies.each do |movie|
        Movie.find_or_create_by(api_movie_id: movie["imdbID"]) do |m|
          m.title = movie["Title"]
          m.poster = movie["Poster"]
          m.user_id = current_user.id
        end
      end
    end
  end
end
