require 'minitest/autorun'
require 'minitest/rg'
require 'pry'

require_relative '../models/tag.rb'

class TagTest < Minitest::Test

  def setup
    system('ruby ../db/transaction_seed.rb')
    @tag1 = Tag.new('name' => 'Christmas Shopping')
  end

  def test_can_get_all_tags
    assert_equal(4, Tag.all.length)
  end

  def test_can_create
    assert_equal(Tag, @tag1.class) 
  end

  def test_no_id_until_saved
    assert_nil(@tag1.id) 
  end

  def test_id_assigned_on_save
    @tag1.save
    refute_nil(@tag1.id)
  end

  def test_saved_appears_in_database
    @tag1.save
    assert_equal(5, Tag.all.length)
  end
  
  def test_can_be_deleted
    @tag1.save
    @tag1.delete
    assert_equal(4, Tag.all.length)
  end

  def test_can_be_updated
    @tag1.save
    @tag1.name='Partying'
    @tag1.update
    result = Tag.find(@tag1.id).name
    assert_equal('Partying', result)
  end

  def test_can_delete_all
    Tag.delete_all
    result = Tag.all.length
    assert_equal(0, result)
  end

  def test_last__true
    Tag.delete_all
    assert_equal(true, Tag.last?)
  end

  def test_last__false
    Tag.delete_all
    @tag1.save  
    @tag1.save  
    @tag1.save  
    assert_equal(false, Tag.last?)
  end
end

