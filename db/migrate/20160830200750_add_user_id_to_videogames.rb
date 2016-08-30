class AddUserIdToVideogames < ActiveRecord::Migration[5.0]
  def change
    add_column :videogames, :user_id, :integer
  end
end
