get '/transactions' do
  @transactions = Transaction.all
  erb(:'transactions/index')
end

get '/transactions/new' do
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:'transactions/new')
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i) 
  erb(:'transactions/show')
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to 'transactions'
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transactions'
end


