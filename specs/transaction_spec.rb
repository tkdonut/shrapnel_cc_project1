require 'minitest/autorun'
require 'minitest/rg'
require 'pry'

require_relative '../models/transaction.rb'
require_relative '../models/tag.rb'
require_relative '../models/vendor.rb'

class TransactionTest < Minitest::Test

  def setup
    load('../db/transaction_seed.rb')
    @vendor1 = Vendor.new('name' => 'The Sultan')
    @vendor1.save
    @tag1 = Tag.new('name' => 'Fast Food')
    @tag1.save
    @transaction1 = Transaction.new(
      'amount' => 4.00,
      'vendor_id' => @vendor1.id,
      'tag_id' => @tag1.id
    )
  end

  def test_can_get_all_transactions
    assert_equal(8, Transaction.all.length)
  end

  def test_can_be_found
    @transaction1.save
    result = Transaction.find(@transaction1.id).class
    assert_equal(Transaction, result)

  end

  def test_can_create
    assert_equal(Transaction, @transaction1.class) 
  end

  def test_no_id_until_saved
    assert_nil(@transaction1.id) 
  end

  def test_id_assigned_on_save
    @transaction1.save
    refute_nil(@transaction1.id)
  end

  def test_saved_appears_in_database
    @transaction1.save
    assert_equal(9, Transaction.all.length)
  end
  
  def test_can_be_deleted
    @transaction1.save
    @transaction1.delete
    assert_equal(8, Transaction.all.length)
  end

  def test_can_be_updated
    @transaction1.save
    @transaction1.amount=5.00
    @transaction1.update
    result = Transaction.find(@transaction1.id).amount
    assert_equal(5.00, result)
  end

  def test_can_delete_all
    Vendor.delete_all
    result = Vendor.all.length
    assert_equal(0, result)
  end
end

load('../db/transaction_seed.rb')
