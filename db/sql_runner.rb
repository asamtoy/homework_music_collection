require('pg')

class SqlRunner
  def SqlRunner.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'music_homework', host: 'localhost'})
      db.prepare('query', sql)
      db.exec_prepared('query', values)
      result = db.exec_prepared('query', values)
    ensure
      db.close()
    end
  return result

  end
end
