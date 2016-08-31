class AddUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer # added column to reviews, and it has user_id and it's and integer
  end
end
