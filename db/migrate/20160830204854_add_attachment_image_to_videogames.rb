class AddAttachmentImageToVideogames < ActiveRecord::Migration
  def self.up
    change_table :videogames do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :videogames, :image
  end
end
