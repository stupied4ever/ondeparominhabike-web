# -*- encoding : utf-8 -*-
require 'spec_helper'

describe LugaresController do
  before(:each) do
    Factory(:lugar)
    Factory(:lugar)
    Factory(:lugar)
  end
    
  describe "GET index" do
    it "deve pegar todos os lugares" do
      get :index
      assigns(:lugares).should eq(Lugar.all)
    end
    
    it "deve pegar os lugares que ainda nao foram sincronizados" do
      puts Lugar.all.size
      l = Lugar.all.last
      l.updated_at = "2013-02-18 01:11:12"
      l.save
      
      get :index, :since => '2013-01-18 01:11:12'
      assigns(:lugares).size.should == 1
    end

  end
end