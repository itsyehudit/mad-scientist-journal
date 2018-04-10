require 'sinatra'

set :views, settings.root + '/web/views'
set :public_folder, settings.root + '/web/stylesheets'

get '/' do
  haml :index
end
