require('pg')
require_relative('../db/music.sql')

class Albums
  attr_accessor(:name, :genre)
  attr_reader(:artist_id)

  def initialize(album_data)
    @id = album_data['id']
    @album_name = album_data['album_name']
    @genre = album_data['genre']
  end

  def album
    sql = '
    SELECT * FROM albums
    WHERE artist_id = $1;'

  end

  def Albums.all()
    db = PG.connect({dbname: 'music_homework', host:'localhost'})
    sql = 'SELECT * FROM albums;'
    db.prepare('all', sql)
    all_albums = db.exec_prepared('all', [])
    db.close()
    return all_albums.map {|album_hash| Albums.new(album_hash)}
  end

  def save
    db = PG.connect({dbname: 'music', host: 'localhost'})
    sql = '
    INSERT INTO albums (
    name
    ) VALUES (
    $1, $2, $3
    )
    RETURNING *;'
    db.prepare('save', sql)
    returned_data = db.exec_prepared('save', [@album_name, @genre])
    db.close()
    returned_hash = returned_data[0]
    id = returned_hash['id']
    @id = id.to_i()
  end

end
