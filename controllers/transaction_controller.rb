get '/transactions/' do
  @transactions = Transaction.all
  erb(:'transactions/index')
end
