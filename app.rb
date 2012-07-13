require "sinatra"
require 'koala'

enable :sessions
set :raise_errors, false
set :show_exceptions, false

before do
  # HTTPS redirect
  if settings.environment == :production && request.scheme != 'https'
    redirect "https://#{request.env['HTTP_HOST']}"
  end
end

get "/" do
  erb :index
end
