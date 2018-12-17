get '/vendors' do
  @vendors = Vendor.all
  erb(:'vendors/index')
end

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'])
  erb(:'vendors/show')
end

post '/vendors/:id/delete' do
  @vendor = Vendor.new(params)
  @vendor.delete
  redirect to '/vendors'
end
