require 'pry'

require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'models/vendor'
require_relative 'models/tag'
require_relative 'models/transaction'
require_relative 'models/budget'

require_relative 'controllers/tags_controller'
require_relative 'controllers/vendors_controller'
require_relative 'controllers/transactions_controller'
require_relative 'controllers/budgets_controller'

also_reload('../models/*')
also_reload('../views/*')

get '/' do
  erb(:index)
end
