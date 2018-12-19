require_relative '../db/sql_runner.rb'
class Budget
  attr_reader :id
  attr_accessor :maxspend, :tag_id

  def initialize(options)
    @id = options['id'] if options['id']
    @maxspend = options['maxspend'].to_f 
    @tag_id = options['tag_id']
  end

# Class methods

  def self.all
    sql = 'SELECT * FROM budgets'
    results = SqlRunner.run(sql)
    results.map { |budget| Budget.new(budget) }
  end

  def self.delete_all
    sql = 'DELETE FROM budgets'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql =
      "SELECT * FROM budgets
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    Budget.new(results.first) 
  end

 # Instance Methods

  def save
    sql =
      "INSERT INTO budgets (maxspend, tag_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@maxspend, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
    self
  end

  def delete
    sql = "DELETE FROM budgets
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE budgets
    SET (maxspend, tag_id) = ($1, $2)
    WHERE id = $3'
    values = [@maxspend, @tag_id, @id]
    SqlRunner.run(sql, values)
  end
end
  
