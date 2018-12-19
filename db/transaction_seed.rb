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
vendor5 = Vendor.new({'name' => 'Peppers Sandwiches'}).save
vendor6 = Vendor.new({'name' => 'Uber'}).save
vendor7 = Vendor.new({'name' => 'Castle Terrace'}).save
vendor9 = Vendor.new({'name' => 'Lothian Buses'}).save
vendor1O = Vendor.new({'name' => 'Fatty Owls'}).save
vendor11 = Vendor.new({'name' => 'Edinburgh Council'}).save

Transaction.delete_all

transaction1 = Transaction.new ({
  'amount' => '5.99',
  'vendor_id' => vendor1.id,
  'tag_id' => ent.id,
  'time' => 'Thursday, 13-Dec-2018 17:30:00 GMT+0000'
})
transaction1.save

transaction2 = Transaction.new ({
  'amount' => '1.80',
  'vendor_id' => vendor4.id,
  'tag_id' => travel.id,
  'time' => 'Thursday, 13-Dec-2018 07:01:20 GMT+0000'
})
transaction2.save

transaction3 = Transaction.new ({
  'amount' => '4.89',
  'vendor_id' => vendor2.id,
  'tag_id' => ent.id,
  'time' => 'Thursday, 13-Dec-2018 20:25:13 GMT+0000'
})
transaction3.save

transaction4 = Transaction.new ({
  'amount' => '4.89',
  'vendor_id' => vendor2.id,
  'tag_id' => ent.id,
  'time' => 'Thursday, 13-Dec-2018 20:45:29 GMT+0000'
})
transaction4.save

transaction5 = Transaction.new ({
  'amount' => '4.89',
  'vendor_id' => vendor2.id,
  'tag_id' => ent.id,
  'time' => 'Thursday, 13-Dec-2018 21:03:30 GMT+0000'
})
transaction5.save

transaction6 = Transaction.new ({
  'amount' => '5.99',
  'vendor_id' => vendor2.id,
  'tag_id' => ent.id,
  'time' => 'Thursday, 13-Dec-2018 21:54:09 GMT+0000'
})
transaction6.save

transaction7 = Transaction.new ({
  'amount' => '129.50',
  'vendor_id' => vendor11.id,
  'tag_id' => bills.id,
  'time' => 'Thursday, 13-Dec-2018 17:30:00 GMT+0000'
})
transaction7.save

transaction8 = Transaction.new ({
  'amount' => '5.00',
  'vendor_id' => vendor5.id,
  'tag_id' => food.id,
  'time' => 'Thursday, 13-Dec-2018 17:30:00 GMT+0000'
})
transaction8.save

