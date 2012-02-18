class LugaresController < InheritedResources::Base
  def index
      @lugares = Lugar.since(params[:since]) if params[:since]
      index! do |format|
        format.html 
        format.json { 
          ultimo_atualizado = @lugares.ultimo_atualizado.first
          @sincronizacao = {:ultima_atualizacao => (ultimo_atualizado ? ultimo_atualizado.updated_at : nill) , :lugares => @lugares}
          render json: @sincronizacao
        }
      end
   end
end
