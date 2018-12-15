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

before do
	@curators = Curators.all 
	@actors = Actors.all
	@scripts = Scripts.all
end

get '/' do
	erb :index			
end

post '/rec' do
	a = Actors.new params[:actor]
	a.save
	
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
	erb :all			
end

get '/success' do
	erb :success			
end

get '/denied' do
	erb :denied		
end

get '/admin_all_test' do
	erb :admin_all_test	
end