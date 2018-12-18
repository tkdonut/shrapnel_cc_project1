get '/vendors' do
  @vendors = Vendor.all
  erb(:'vendors/index')
end

get '/vendors/new' do
  erb(:'vendors/new')
end

get '/vendors/:id/edit' do
  @vendor = Vendor.find(params['id'])
  erb(:'vendors/edit')
end

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'])
  @last = Vendor.all.length < 2
  erb(:'vendors/show')
end

post '/vendors/:id/delete' do
  @vendor = Vendor.new(params)
  @vendor.delete
  redirect to '/vendors'
end

post '/vendors' do
  vendor = Vendor.new(params)
  vendor.save
  redirect to '/vendors'
end

post '/vendors/:id/edit' do
  vendor = Vendor.new(params)
  vendor.update
  redirect to '/vendors'
end
