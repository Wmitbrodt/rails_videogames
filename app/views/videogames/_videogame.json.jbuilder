json.extract! videogame, :id, :title, :description, :videogame_difficulty, :publisher, :rating, :created_at, :updated_at
json.url videogame_url(videogame, format: :json)