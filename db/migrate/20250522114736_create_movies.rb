class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :api_movie_id
      t.float :api_rating
      t.date :watch_date
      t.string :remarks
      t.float :personal_rating
      t.string :poster
      t.boolean :is_favorite
      t.boolean :is_soon_to_watch
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
