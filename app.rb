require "sinatra"

enable :sessions
set :raise_errors, false
set :show_exceptions, false

get "/" do
  erb :instrucao_unica
end
