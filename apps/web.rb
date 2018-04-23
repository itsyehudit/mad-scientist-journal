require 'sinatra'
require_relative '../lib/file_journal'

set :views, settings.root + '/web/views'
set :public_folder, settings.root + '/web/stylesheets'

get '/' do
  @title = "Main Menu"
  haml :index
end
