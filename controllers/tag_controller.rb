require('sinatra')
require('sinatra/contrib/all')
require_relative '../models/tag.rb'

get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:'tags/show')
end

post '/tags/:id/delete' do
  @tag = Tag.new(params)
  @tag.delete
  redirect to '/tags'
end
