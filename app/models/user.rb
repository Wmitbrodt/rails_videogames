class User < ApplicationRecord
  
  has_many :videogames
  has_many :reviews, dependent: :destroy # if user deletes account, we want their reviews gone too

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
