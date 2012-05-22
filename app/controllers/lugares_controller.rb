class LugaresController < InheritedResources::Base
  def index
      @lugares = Lugar.desde(params[:desde]) if params[:desde]
      index! do |format|
        format.html 
        format.json { 
          ultimo_atualizado = @lugares.ultimo_atualizado.first + 1.second
          @sincronizacao = {:ultima_atualizacao => (ultimo_atualizado ? ultimo_atualizado.updated_at : nill) , :lugares => @lugares}
          render json: @sincronizacao
        }
      end
   end
end
