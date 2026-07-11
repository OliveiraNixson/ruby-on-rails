class SucosController < ApplicationController
    before_action :set_suco, only: %i[edit update show destroy]

    def edit
    end

    def update
        if @suco.update(suco_params)
            redirect_to root_path
        else 
            render :new
        end
        
    end 

    def new 
        @suco = Suco.new
    end 

    def create
        @suco = Suco.new(suco_params)
        if @suco.save
            redirect_to root_path
        else 
            render :new
        end 
    end 

    def show
    end 

    def destroy 
    end

    def disponibility
        @sucos = Suco.all
    end 

    def update_disponibility
        puts("=======================Aqui======================")
        puts(params)
        if params[:sucos].present? 
            params[:sucos].each do |id, attr|
                @suco = Suco.find(id)
                @suco.update(disponibility: attr[:disponibility])
            end 
            redirect_to root_path, notice: "atualizado com sucesso"
        end 
    end 
    
    private 
    
    def set_suco
        @suco = Suco.find_by(params[:id])
    end
    
    def suco_params
        params.require(:suco).permit(:name, :disponibility)
    end
end
