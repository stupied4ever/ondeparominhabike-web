class LugaresController < InheritedResources::Base
  def index
      @lugares = Lugar.desde(params[:desde]) if params[:desde]
      index! do |format|
        format.html 
        format.json { 
          ultimo_atualizado = @lugares.ultimo_atualizado.first 
          @sincronizacao = {:ultima_atualizacao => (ultimo_atualizado ? ultimo_atualizado.updated_at + 1.second : nil) , :lugares => @lugares, :quantidade => @lugares.size}
          render json: @sincronizacao
        }
      end
   end
   
   def count
       @lugares = Lugar.desde(params[:desde]) if params[:desde]
       index! do |format|
         format.html 
         format.json { 
           ultimo_atualizado = @lugares.ultimo_atualizado.first 
           @sincronizacao = {:ultima_atualizacao => (ultimo_atualizado ? ultimo_atualizado.updated_at + 1.second : nil) , :quantidade => @lugares.size }
           render json: @sincronizacao
         }
       end
    end
end
