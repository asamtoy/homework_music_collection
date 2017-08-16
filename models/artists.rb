require('pg')
require_relative('../db/music')

class Artists
  attr_accessor(:name)

  def initialize(artist_data)
    @id = artist_data(['id'])
    @name = artist_data['name']
  end


end
