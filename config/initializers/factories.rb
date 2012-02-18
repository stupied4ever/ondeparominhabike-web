# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :lugar do
    tipo "residencia"
    nome "casa do rafael"
    endereco_rua "rua brigadeiro araujo"
    endereco_numero "76"
    endereco_bairro "freguesia do ó"
    endereco_cidade "sao paulo"
    endereco_estado "SP"
    
    latitude 123123
    longitude 123123
  end
end