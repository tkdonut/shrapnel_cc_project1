require 'minitest/autorun'
require 'minitest/rg'
require 'pry'

require_relative '../models/vendor.rb'

class VendorTest < Minitest::Test

  def setup
    load('../db/transaction_seed.rb')
    @vendor1 = Vendor.new('name' => 'The Sultan')
  end

  def test_can_get_all_vendors
    assert_equal(10, Vendor.all.length)
  end

  def test_can_create
    assert_equal(Vendor, @vendor1.class) 
  end

  def test_no_id_until_saved
    assert_nil(@vendor1.id) 
  end

  def test_id_assigned_on_save
    @vendor1.save
    refute_nil(@vendor1.id)
  end

  def test_saved_appears_in_database
    @vendor1.save
    assert_equal(11, Vendor.all.length)
  end
  
  def test_can_be_deleted
    @vendor1.save
    @vendor1.delete
    assert_equal(10, Vendor.all.length)
  end

  def test_can_be_updated
    @vendor1.save
    @vendor1.name='Partying'
    @vendor1.update
    result = Vendor.find(@vendor1.id).name
    assert_equal('Partying', result)
  end

  def test_can_delete_all
    Vendor.delete_all
    result = Vendor.all.length
    assert_equal(0, result)
  end
end

load('../db/transaction_seed.rb')
