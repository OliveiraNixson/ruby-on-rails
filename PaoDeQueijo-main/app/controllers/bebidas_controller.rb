class BebidasController < ApplicationController
    before_action :set_bebida, only: %i[edit update destroy show]

    def edit
    end 

    def update
        if @bebida.update(bebida_params)
            redirect_to root_path
        else 
            render :edit
        end
    end 

    def new
        @bebida = Bebida.new
    end 

    def create
        @bebida = Bebida.new(bebida_params)
        if @bebida.save 
            redirect_to root_path
        else 
            render :new
        end 
    end 

    def destroy
        if @bebida.destroy
            redirect_to root_path
        else     
            render :show
        end 
    end

    def show
    end

    private

    def set_bebida
        @bebida = Bebida.find(params[:id])
    end

    def bebida_params
        params.require(:bebida).permit(:name, :price, :volume)
    end
end
