require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:nagrani.db"

class Actors < ActiveRecord::Base
end

class Curators < ActiveRecord::Base
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/rec' do
	erb "Rec"			
end

get '/story' do
	erb "Story"			
end

get '/noname' do
	erb "No Name"			
end