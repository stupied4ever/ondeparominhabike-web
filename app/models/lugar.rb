class Lugar < ActiveRecord::Base
  geocoded_by :endereco_completo   # can also be an IP address
  scope :desde, lambda { |*args| {:conditions => ["updated_at > ?", (args.first)]} }
  scope :ultimo_atualizado, lambda { |*args| {:order => "updated_at DESC", :limit => 1} }
  
  before_validation :geocode, :if => :executa_geocode        # auto-fetch coordinates
  
  validates_presence_of :nome, :latitude, :longitude
  
  def endereco_completo
    return  "#{endereco_rua} #{endereco_numero}, #{endereco_cidade}, #{endereco_estado}"
  end
  
  private 
  def executa_geocode
    # puts "chamou o geocode ? #{}"
    Rails.env != "test"
  end
end
