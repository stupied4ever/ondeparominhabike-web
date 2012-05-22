# -*- encoding : utf-8 -*-
class Lugar < ActiveRecord::Base
  scope :desde, lambda { |*args| {:conditions => ["updated_at > ?", (args.first)]} }
  scope :ultimo_atualizado, lambda { |*args| {:order => "updated_at DESC", :limit => 1} }

  before_validation :reverse_geocode, :if => :executa_geolocalizacao_reversa
  before_validation :geocode, :atualiza_latitude_e_longitude, :if => :executa_geolocalizacao        # auto-fetch coordinates
  

  validates_presence_of :nome, :latitude, :longitude, :endereco
  before_save :atualiza_endereco
  
  attr_writer :executa_geolocalizacao_reversa
  attr_accessor :endereco_consultado
  
  geocoded_by :endereco, :latitude  => :latitude_consultada, :longitude => :longitude_consultada
  reverse_geocoded_by :latitude, :longitude, :address => :endereco
  
  private 
  def atualiza_endereco
    self.endereco = endereco_consultado if executa_geolocalizacao_reversa && endereco_consultado
  end
  
  def executa_geolocalizacao_reversa
    @executa_geolocalizacao_reversa == true
  end
  
  def executa_geolocalizacao
    # puts "chamou o geocode ? #{}"
    self.latitude = -23.49568 if Rails.env == "test" && !self.endereco.blank?
    self.longitude = -46.6940590 if Rails.env == "test" && !self.endereco.blank?

    return executa_geolocalizacao_reversa != true && Rails.env != "test"
  end
end
