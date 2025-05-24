class Movie < ApplicationRecord
  belongs_to :user

  has_many :favorite_movies_by_users
  has_many :users_favorite, through: :favorite_movies_by_user, source: :user

  has_many :soon_to_watch_movies_by_users
  has_many :users_soon_to_watch, through: :soon_to_watch_movies_by_user, source: :user

  has_many :already_watched_movies_by_users
  has_many :users_already_watched, through: :already_watched_movies_by_user, source: :user

  validates :title, presence: true
  validates :api_movie_id, presence: true
end
