# encoding: utf-8
require "sinatra"

enable :sessions
set :raise_errors, false
set :show_exceptions, false

get "/" do
  erb :instrucao_unica
end

post "/cobrar" do
    # puts "Params #{params}"
    dados_cobranca = {
                        :value => "8.90",
                        :unique_id => params["id_proprio"],
                        :reason => "Um motivo qualquer",
                        :payer => {
                          :name => "Luiz Inácio Lula da Silva",
                          :email => "presidente@planalto.gov.br",
                          :payer_id => "um-id-qualquer",
                          :mobile_phone => "(61)9999-9999",
                          :nickname => "Lula",
                          :identity => "111.111.111-11",
                          :street => "Praça dos Três Poderes",
                          :number => "0",
                          :complement => "Palácio do Planalto",
                          :neighborhood => "Zona Cívico-Administrativa",
                          :city => "Brasília",
                          :state => "DF",
                          :country => "BRA",
                          :zipcode => "70100-000",
                          :phone => "(61)3211-1221"
                        }
                      }
    response = Rmoip.sandbox("01010101010101010101010101010101","ABABABABABABABABABABABABABABABABABABABAB")
        .send(dados_cobranca)
    puts "Response: #{@response}"
    # puts "Token #{@response.token}"

    erb :response
end
