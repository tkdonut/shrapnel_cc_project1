require 'pry'

require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'models/vendor'
require_relative 'models/tag'
require_relative 'models/transaction'

require_relative 'controllers/tag_controller'
require_relative 'controllers/vendor_controller'
require_relative 'controllers/transaction_controller'

also_reload('../models/*')
also_reload('../views/*')

get '/' do
  erb(:index)
end
