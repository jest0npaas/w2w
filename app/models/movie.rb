class Movie < ApplicationRecord
  belongs_to :user

  validates: :title, presence: true
  validates: :api_movie_id, presence: true
end
