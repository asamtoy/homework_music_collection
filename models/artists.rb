require('pg')
require_relative('../db/music.sql')

class Artists
  attr_accessor(:name)

  def initialize(artist_data)
    @id = artist_data['id']
    @name = artist_data['name']
  end

  def artists
    sql = '
    SELECT * FROM artists
    WHERE artist_id = $1;'

  end

  def Artists.all()
    db = PG.connect({dbname: 'music', host:'localhost'})
    sql = 'SELECT * FROM artists;'
    db.prepare('all', sql)
    all_artists = db.exec_prepared('all', [])
    db.close()
    return all_artists.map {|artist_hash| Artists.new(artist_hash)}
  end

  def save
    db = PG.connect({dbname: 'music', host: 'localhost'})
    sql = '
    INSERT INTO artists (
    name
    ) VALUES (
    $1
    )
    RETURNING *;'
    db.prepare('save', sql)
    returned_data = db.exec_prepared('save', [@name])
    db.close()
    returned_hash = returned_data[0]
    id = returned_hash['id']
    @id = id.to_i()
  end

end
