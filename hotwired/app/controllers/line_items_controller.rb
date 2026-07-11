class LineItemsController < ApplicationController
    before_action :set_quote
    before_action :set_line_item_date
    before_action :set_line_item, only: [:edit, :update, :destroy]
    
    def new
        @line_item = @line_item_date.line_items.build
    end 

    def create 
        @line_item = @line_item_date.line_items.build(line_item_params)

        respond_to do |format|
            if @line_item.save 
                format.html { redirect_to quote_path(@line_item_date.quote), notice: "Line item was successufully created" }
                format.turbo_stream do 
                    flash.now[:notice] = "Line item was successufully created."
                end
            else 
                format.html { render :new, status: :unprocessable_entity } 
            end 
        end 
    end 

    def edit
    end 

    def update
        respond_to do |format|
            if @line_item.update(line_item_params)
                format.html { redirect_to quote_path(@line_item_date.quote), notice: "Line item was successufully created" }
                format.turbo_stream do 
                    flash.now[:notice] = "Line item was successufully created."
                end
            else 
                format.html { render :new, status: :unprocessable_entity } 
            end
        end
    end 


    def destroy
        @line_item.destroy!
        respond_to do |format|
            format.html{
                redirect_to quote_path(@quote), notice: "Line Item was successufully destroyed."
            }
            format.turbo_stream {
                flash.now[:notice] = "Line Item was successufully destroyed"
            }
        end
    end

    private

    def set_line_item
        @line_item = LineItem.find(params[:id])
    end
    
    def set_quote
        @quote = current_company.quotes.find(params[:quote_id])
    end

    def set_line_item_date
        @line_item_date = LineItemDate.find(params[:line_item_date_id])
    end

    def line_item_params 
        params.require(:line_item).permit(:name, :unit_price, :description, :quantity, :line_item_date_id)
    end
end
