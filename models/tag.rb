require_relative '../db/sql_runner.rb'

class Tag
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # Class methods

  def self.last?
    Tag.all.length <= 1
  end

  def self.all
    sql = 'SELECT * FROM tags'
    results = SqlRunner.run(sql)
    results.map { |tag| Tag.new(tag) }
  end

  def self.delete_all
    sql = 'DELETE FROM tags'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql =
      "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    Tag.new(results.first) 
  end

  # Instance methods

  def save
    sql =
      "INSERT INTO tags (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
    self
  end

  def delete
    sql = "DELETE FROM tags
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE tags
    SET name = $1
    WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def transactions
    sql = "SELECT * FROM transactions
           WHERE tag_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).map do |transaction|
      Transaction.new(transaction)
    end
  end

  def vendors
    sql = "SELECT v.* FROM
          transactions t INNER JOIN vendors v
          ON t.vendor_id = v.id
          WHERE t.tag_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).map {
      |vendor| Vendor.new(vendor)
    }
  end
end
