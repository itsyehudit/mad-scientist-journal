require 'sinatra'
require_relative '../lib/file_journal'

set :views, settings.root + '/web/views'
set :public_folder, settings.root + '/web'

get '/' do
  @title = "Main Menu"
  haml :index
end

get '/add' do
  @title = "Add Entry"
  haml :add_entry
end

post '/add' do
  journal = FileJournal.new
  title = params[:title]
  content = params[:content]
  date = Time.now
  journal.add_entry(content, title, date)
  journal.quit

  redirect "/view"
end

get '/view' do
  journal = FileJournal.new
  @entries = journal.entries
  @title = "Entries"
  haml :view
end

get '/view/:index' do
  journal = FileJournal.new
  @id = params[:index].to_i
  @entry = journal.entries[@id]
  @title = "Entry no. #{@id}"
  haml :entry
end

get '/edit/:index' do
  journal = FileJournal.new
  @id = params[:index].to_i
  @entry = journal.entries[@id]
  @title = "Edit entry no. #{@id}"
  haml :entry_edition
end

post '/edit/:index' do
  journal = FileJournal.new
  id = params[:index].to_i
  entry = journal.entries[id]
  title = params[:title]
  content = params[:content]
  date = entry.date
  journal.edit_entry(id, content, title, date)
  journal.quit

  redirect "/view/#{id}"
end

post '/delete/:index' do
  journal = FileJournal.new
  id = params[:index].to_i
  journal.delete_entry(id)
  journal.quit

  redirect "/view"
end
