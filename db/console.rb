require('pry-byebug')
require_relative('../models/artists.rb')
require_relative('../models/albums.rb')

artist1 = Artists.new({'name' => 'Stereophonics'})
artist2 = Artists.new({'name' => 'Jonathan Richman'})
artist1.save
artist2.save

album1 = Albums.new({"album_name" => "Don't Let Me Down", "genre" => "rock"})

album1.save

binding.pry
nil
