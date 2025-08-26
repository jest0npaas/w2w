class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy

  has_many :favorite_movies_by_users, dependent: :destroy
  has_many :favorite_movies, through: :favorite_movies_by_users, source: :movie

  has_many :soon_to_watch_movies_by_users, dependent: :destroy
  has_many :soon_to_watch_movies, through: :soon_to_watch_movies_by_users, source: :movie

  has_many :already_watched_movies_by_users, dependent: :destroy
  has_many :already_watched_movies, through: :already_watched_movies_by_users, source: :movie

  validates :name, presence: true
end
