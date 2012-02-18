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
      
      get :index, :desde => '2013-01-18 01:11:12'
      assigns(:lugares).size.should == 1
    end
    
    
    it "quando for uma requisicao json, deve voltar a maior data de atualizacao dos lugares e os lugares atualizados" do
      l = Lugar.all.last
      l.updated_at = "2013-02-18 01:11:12"
      l.save
      
      data_busca = '2013-01-18 01:11:12'
      lugares_atualizados = Lugar.desde(data_busca)
      
      get :index, :desde => data_busca, :format => :json
      sinc = assigns(:sincronizacao)
      sinc.size.should == 2
      assert_equal "2013-02-18T01:11:12Z", json_response['ultima_atualizacao']
      assert_equal lugares_atualizados.to_json, json_response['lugares'].to_json
    end

  end
  
  def json_response
      ActiveSupport::JSON.decode @response.body
  end
end