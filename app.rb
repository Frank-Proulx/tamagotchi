require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
require('pry')
also_reload('lib/**/*.rb')

get('/home') do
  erb(:home)
end
get('/') do
  erb(:home)
end

post('/game') do
  @pet = Tamagotchi.new({:name => params[:name]})
  erb(:game)
end
