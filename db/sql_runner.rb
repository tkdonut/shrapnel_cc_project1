require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect(dbname: 'shrapnel', host: 'localhost')
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close unless db.nil?
    end
    result
  end

end
