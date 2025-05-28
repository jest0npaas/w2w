class RemoveColumnsFromMovies < ActiveRecord::Migration[8.0]
  def change
    remove_column :movies, :watch_date, :date
    remove_column :movies, :remarks, :string
    remove_column :movies, :personal_rating, :float
    remove_column :movies, :is_favorite, :boolean
    remove_column :movies, :is_soon_to_watch, :boolean
  end
end
