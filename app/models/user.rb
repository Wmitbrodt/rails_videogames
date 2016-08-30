class User < ApplicationRecord
  
  has_many :videogames

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
