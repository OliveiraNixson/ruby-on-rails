class SalgadosController < ApplicationController
    before_action :set_salgado, only: %i[ show edit update destroy]

    def edit
    end 

    def update
        if @salgado.update(salgado_params)
            redirect_to root_path
        else
            render :new
        end 
    end

    def new
        @salgado = Salgado.new
    end 

    def create 
        @salgado = Salgado.new(salgado_params)

        if @salgado.save
            redirect_to root_path
        else 
            render :new
        end
    end 

    def destroy 
        if @salgado.destroy
            redirect_to salgados_path
        else 
            render :show
        end 
    end 

    def show
    end

    def disponibility
        @salgados = Salgado.all
    end

    def update_disponibility
        if params[:salgados].present? 
            params[:salgados].each do |id, attr|
                @salgado = Salgado.find(id)
                @salgado.update(disponibility: attr[:disponibility])
            end 
            redirect_to root_path, notice: "Disponibilidade atualizada com sucesso!"
        end 
    end


    private

    def set_salgado 
        @salgado = Salgado.find(params[:id])
    end 

    def salgado_params
        params.require(:salgado).permit(:name, :price, :mass)
    end
end
