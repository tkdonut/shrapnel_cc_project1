require_relative '../db/sql_runner.rb'
class Transaction
  attr_reader :id
  attr_accessor :amount, :tag_id, :vendor_id, :time
  def initialize(options)
    @id = options['id'] if options['id']
    @amount = options['amount'].to_i
    @tag_id = options['tag_id']
    @vendor_id = options['vendor_id']
    #If no timestamp already exists set to current date
    if options['time'] 
      @time= DateTime.parse(options['time'])
    else
      @time= DateTime.now
    end
  end
################################################## 
# Class methods
################################################## 

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |transaction| Transaction.new( transaction ) }
  end

  def self.find( id )
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Transaction.new( results.first )
  end
################################################## 
# Instance methods
################################################## 

  def save()
    sql = 
    "INSERT INTO transactions (amount, tag_id, vendor_id, time)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@amount, @tag_id, @vendor_id, @time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    return self
  end 
  
  def update
    sql = 'UPDATE transactions
    SET (amount, tag_id, vendor_id, time) = ($1, $2, $3, $4)
    WHERE id = $5'
    values = [@amount, @tag_id, @vendor_id, @time, @id]
    SqlRunner.run(sql, values)
  end
  
  def tag
    sql = "SELECT * FROM tags
          WHERE id = $1"
    values = [@tag_id]
    return Tag.new(SqlRunner.run(sql, values).first)
  end
  
  def vendor
    sql = "SELECT * FROM vendors
          WHERE id = $1"
    values = [@vendor_id]
    return Vendor.new(SqlRunner.run(sql, values).first)
  end

  def delete
    sql = "DELETE FROM transactions
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
