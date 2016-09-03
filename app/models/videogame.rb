class Videogame < ApplicationRecord

	searchkick 

	belongs_to :user
	has_many :reviews

	validates :title, :description, :videogame_difficulty, :publisher, :rating, presence: true

	has_attached_file :image, styles: { medium: "400x600#" } # 400x600 with # will crop the image 
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end


