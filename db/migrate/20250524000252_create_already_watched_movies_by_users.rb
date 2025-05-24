class CreateAlreadyWatchedMoviesByUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :already_watched_movies_by_users do |t|
      t.float :personal_rating
      t.string :remarks
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
