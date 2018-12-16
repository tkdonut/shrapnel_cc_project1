get '/vendors' do
  @vendors = Vendor.all
  erb(:'vendors/index')
end
