class AddVideogameIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :videogame_id, :integer
  end
end
