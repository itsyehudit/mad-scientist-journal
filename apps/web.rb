require 'sinatra'
require_relative '../lib/file_journal'

set :views, settings.root + '/web/views'
set :public_folder, settings.root + '/web/stylesheets'

get '/' do
  @title = "Main Menu"
  haml :index
end

get '/add' do
  @title = "Add Entry"
  haml :add_entry
end

post '/add' do
  journal=FileJournal.new
  title = params[:title]
  content = params[:content]
  date = Time.now
  journal.add_entry(content, title, date)
  journal.quit

  redirect "/view"
end

get '/entries_menu' do
  @title = "Entries menu"
  haml :entries_menu
end

get '/view' do
  journal=FileJournal.new
  @entries = journal.entries
  @title = "Entries"
  haml :view
end

get '/view/:index' do
  journal=FileJournal.new
  @id = params[:index].to_i
  @entry = journal.entries[@id]
  @title = "Entry no. #{@id}"
  haml :entry
end
