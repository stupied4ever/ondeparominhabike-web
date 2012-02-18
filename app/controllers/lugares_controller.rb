class LugaresController < InheritedResources::Base
  def index
      @lugares = Lugar.since(params[:since]) if params[:since]
      index!
   end
end
