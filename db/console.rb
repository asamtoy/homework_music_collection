require('pry-byebug')
require_relative('../models/artists.rb')

Artists.delete_all()

artist1 = Artist.new({'name' => 'Stereophonics'})
