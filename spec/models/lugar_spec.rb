require 'spec_helper'

describe Lugar do
  it {should validate_presence_of(:nome)}
  it {should validate_presence_of(:latitude)}
  it {should validate_presence_of(:longitude)}
  
  
  it "tenho um scopo para buscar o ultimo atualido" do
    Factory(:lugar)
    Factory(:lugar)
    Factory(:lugar)
    l = Lugar.first;
    l.updated_at = "2013-01-18 01:11:12"
    l.save!
    Lugar.ultimo_atualizado.first.updated_at.should == "2013-01-18 01:11:12"
    
    l = Lugar.last
    l.updated_at = "2013-02-18 01:11:12"
    l.save!
    
    Lugar.ultimo_atualizado.first.updated_at.should == "2013-02-18 01:11:12"
  end
    
end
