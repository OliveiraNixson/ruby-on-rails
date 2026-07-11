class PagesController < ApplicationController
   
    def home 
        @salgados = Salgado.where(disponibility: true)
        @bebidas = Bebida.all
        @sucos = Suco.where(disponibility: true)
    end

    private 

    def page_params
        params.require(:pages).permit(:salgados, :bebidas)
    end
end
