require 'pry'
require_relative '../models/tag'
require_relative '../models/vendor'
require_relative '../models/transaction'

Tag.delete_all
food = Tag.new({'name' => 'Food'}).save
bills = Tag.new({'name' => 'Bills'}).save
travel = Tag.new({'name' => 'Travel'}).save
ent = Tag.new({'name' => 'Entertainment'}).save

Vendor.delete_all
vendor1 = Vendor.new({'name' => 'Edinburgh Books'}).save
vendor2 = Vendor.new({'name' => 'The Chanter'}).save
vendor3 = Vendor.new({'name' => 'The Blue Blazer'}).save
vendor4 = Vendor.new({'name' => 'Sainsburies'}).save
vendor5 = Vendor.new({'name' => 'Peppers Sandwitches'}).save
vendor6 = Vendor.new({'name' => 'Uber'}).save
vendor7 = Vendor.new({'name' => 'Castle Terrace'}).save
vendor9 = Vendor.new({'name' => 'Lothian Buses'}).save
vendor1O = Vendor.new({'name' => 'Fatty Owls'}).save

Transaction.delete_all

transaction1 = Transaction.new ({
  'amount' => '5.99',
  'vendor_id' => vendor1.id,
  'tag_id' => ent.id,
  'timestamp' => DateTime.parse('Thursday, 13-Dec-2018 17:30:00 GMT+0000')
})
binding.pry
nil
