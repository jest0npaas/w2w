class CreateFavoriteMoviesByUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_movies_by_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
