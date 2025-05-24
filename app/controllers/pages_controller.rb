class PagesController < ApplicationController
  def index
  end

  def search
  end

  def results
    # real API call
    @movies = MovieApi.get_movies_by_title(params[:query])["Search"]


    # mock API data call
    # file_path = Rails.root.join("lib", "assets", "search.json")
    # @movies = JSON.parse(File.read(file_path))["Search"]

    @movies.each do |movie|
      Movie.find_or_create_by(api_movie_id: movie["imdbID"]) do |m|
        m.title = movie["Title"]
        m.poster = movie["Poster"]
        m.user_id = 3 # to be changed to current_user
      end
    end
  end
end
