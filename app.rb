#Bringing in gems
require 'pry'

#Bringing in helper class
require_relative 'db/sql_runner'

#Bringing in models
require_relative 'models/vendor'
require_relative 'models/tag'


# Temporary test data while setting up class structures 
vendor1 = Vendor.new({
  'name' => 'Tesco'
})

tag1 = Tag.new({
  'name' => 'Beer'
})

binding.pry
nil
