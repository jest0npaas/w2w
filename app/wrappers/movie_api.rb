require "uri"
require "net/http"

class MovieApi
  def self.get_movies_by_title(query)
    url = URI("https://movie-database-by-based-api.p.rapidapi.com/v1/movies/?s=#{query}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = "b2e991f43amshce9b63effdf72c5p16a73cjsn2c74ee9644af"
    request["x-rapidapi-host"] = "movie-database-by-based-api.p.rapidapi.com"

    response = http.request(request)
    JSON.parse(response.body)
  end

  def self.get_movies_by_id(id)
    url = URI("https://movie-database-by-based-api.p.rapidapi.com/v1/movies/?i=#{id}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = "b2e991f43amshce9b63effdf72c5p16a73cjsn2c74ee9644af"
    request["x-rapidapi-host"] = "movie-database-by-based-api.p.rapidapi.com"

    response = http.request(request)
    JSON.parse(response.body)
  end
end
