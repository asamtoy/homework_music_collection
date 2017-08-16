require('pry-byebug')
require_relative('../models/artists.rb')

# Artists.delete_all()

artist1 = Artists.new({'name' => 'Stereophonics'})

artist1.save
