# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :lugar do
    tipo "residencia"
    nome "casa do rafael"
    #{endereco_rua} #{endereco_numero}, #{endereco_cidade}, #{endereco_estado}
    endereco "rua brigadeiro araujo 76, sao paulo, SP"
  end
end