require_relative '../db/sql_runner.rb'

class Vendor
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

# Class methods

  def self.all()
    sql = "SELECT * FROM vendors"
    results = SqlRunner.run( sql )
    return results.map { |vendor| Vendor.new( vendor ) }
  end

  def self.delete_all
    sql = "DELETE FROM vendors"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM vendors
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Vendor.new( results.first )
  end

# Instance methods

  def save()
    sql = 
    "INSERT INTO vendors (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    return self
  end

  def delete
    sql = "DELETE FROM vendors
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE vendors
    SET name = $1
    WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def transactions
    sql = "SELECT * FROM transactions
           WHERE vendor_id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).map {
      |transaction| Transaction.new(transaction)
    }
  end
  
  def tags
    sql = "SELECT ta.* FROM
          transactions tr INNER JOIN tags ta
          ON tr.tag_id = ta.id
          WHERE tr.vendor_id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).map {
      |vendor| Vendor.new(vendor)
    }
  end
end
