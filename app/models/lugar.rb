class Lugar < ActiveRecord::Base
  geocoded_by :endereco_completo   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def endereco_completo
    return  "#{endereco_rua} #{endereco_numero}, #{endereco_cidade}, #{endereco_estado}"
  end
end
