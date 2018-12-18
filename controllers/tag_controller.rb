get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

get '/tags/new' do
  erb(:'tags/new')
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  @last = Tag.all.length < 2
  erb(:'tags/show')
end

get '/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb(:'tags/edit')
end

post '/tags/:id/delete' do
  @tag = Tag.new(params)
  @tag.delete
  redirect to '/tags'
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to '/tags'
end

post '/tags/:id/edit' do
  tag = Tag.new(params)
  tag.update
  redirect to '/tags'
end
