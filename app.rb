require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:nagrani.db"

class Actors < ActiveRecord::Base
end
 
class Curators < ActiveRecord::Base
end

class Scripts < ActiveRecord::Base
end

get '/' do
	@curators = Curators.all 
	@actors = Actors.all
	erb :index			
end

post '/rec' do
	@actor_name = params[:actor_name]
	@actor_age = params[:actor_age]
	@actor_phone = params[:actor_phone]
	@actor_city = params[:actor_city]
	@actor_link = params[:actor_link]
	@actor_story = params[:actor_story]

	Actors.create :name => @actor_name, :age => @actor_age, :phone => @actor_phone, :city => @actor_city, :link => @actor_link, :role => @actor_story
	
	@title = "Ваша заявка успешно отправлена!"
	@message = "Мы свяжемся с Вами в ближайшее время."

	erb :message
end

get '/rec' do
	erb :rec			
end

get '/story' do
	erb "Story"			
end

post '/script' do
	@script_email = params[:script_email]
	@script_name = params[:script_name]
	@script_content = params[:script_content]

	Scripts.create :email => @script_email, :name => @script_name, :content => @script_content
	
	@title = "Ваша идея успешно отправлена!"
	@message = "Мы обязательно прочтём её, и если она нам понравится, мы свяжемся с Вами!"

	erb :message
end

get '/script' do
	erb :script			
end

get '/all' do
	@actors = Actors.all
	erb :all			
end

get '/success' do
	@actors = Actors.all
	erb :success			
end

get '/denied' do
	@actors = Actors.all
	erb :denied		
end