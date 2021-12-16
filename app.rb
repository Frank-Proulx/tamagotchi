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
  @pet.save
  erb(:game)
end

get('/game') do
  @pet = Tamagotchi.tamagotchis
  erb(:game)
end

patch('/feed') do 
  @pet = Tamagotchi.tamagotchis
  @pet.food_level += 1
  redirect '/game'
end

patch('/play') do
  @pet = Tamagotchi.tamagotchis
  @pet.activity_level += 1
  redirect '/game'
end

patch('/sleep') do
  @pet = Tamagotchi.tamagotchis
  @pet.sleep_level += 1
  redirect '/game'
end
