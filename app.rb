# encoding: utf-8
require "sinatra"

enable :sessions
set :raise_errors, false
set :show_exceptions, false

get "/" do
  erb :instrucao_unica
end

post "/cobrar" do
    puts "Params #{params}"
    moip = Rmoip.login "01010101010101010101010101010101", "ABABABABABABABABABABABABABABABABABABABAB", :SANDBOX
    dados_cobranca = {
                        :valor => params[:valor],
                        :id_proprio => params[:id_proprio],
                        :razao => params[:razao],
                        :pagador => {
                          :nome => "Luiz Inácio Lula da Silva",
                          :email => "presidente@planalto.gov.br",
                          :tel_cel => "(61)9999-9999",
                          :apelido => "Lula",
                          :identidade => "111.111.111-11",
                          :logradouro => "Praça dos Três Poderes",
                          :numero => "0",
                          :complemento => "Palácio do Planalto",
                          :bairro => "Zona Cívico-Administrativa",
                          :cidade => "Brasília",
                          :estado => "DF",
                          :pais => "BRA",
                          :cep => "70100-000",
                          :tel_fixo => "(61)3211-1221"
                        }
                      }
    moip.cobrar(dados_cobranca)
    response = moip.enviar_cobranca
    puts "Response #{response}"
end
