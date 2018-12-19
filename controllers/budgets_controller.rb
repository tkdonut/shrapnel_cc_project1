get '/budgets' do
  @budgets = Budget.all
  erb(:'budgets/index')
end

get '/budgets/new' do
  @tags = Tag.all 
  erb(:'budgets/new')
end

get '/budgets/:id' do
  @budget = Budget.find(params['id'])
  erb(:'budgets/show')
end

get '/budgets/:id/edit' do
  @budget = Budget.find(params['id'])
  erb(:'budgets/edit')
end

post '/budgets/:id/delete' do
  @budget = Budget.new(params)
  @budget.delete
  redirect to '/budgets'
end

post '/budgets' do
  @budget = Budget.new(params)
  binding.pry
  @budget.save
  redirect to '/budgets'
end

post '/budgets/:id/edit' do
  @budget = Budget.new(params)
  @budget.update
  redirect to '/budgets'
end
