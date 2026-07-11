class QuotesController < ApplicationController
    before_action :set_quote, only: [:edit, :update, :show, :destroy]
    def index
        @quotes = current_company.quotes.ordered
    end 

    def edit
    end 

    def update
        respond_to do |format|
            if @quote.update(quote_params)
                format.html { redirect_to quotes_path, notice: "Quote was successufully updated." }
                format.turbo_stream do 
                    flash.now[:notice] = "Quote was successufully updated"
                end
            else 
                redirect_to :edit, status: :unprocessable_entity
            end
        end
    end 

    def new 
        @quote = Quote.new
    end

    def create 
        @quote = current_company.quotes.build(quote_params)
        
        if @quote.save
            respond_to do |format|
                format.html{ redirect_to quotes_path, notice: "Quotes was successufully created" }
                format.turbo_stream do 
                    flash.now[:notice] = "Quotes was successufully created"     
                end
            end
        else
            render :new, status: :unprocessable_entity
        end
    end 

    def show
        @line_item_dates = @quote.line_item_dates.includes(:line_items).ordered
    end

    def destroy
        @quote.destroy

        respond_to do |format| 
            format.html { redirect_to quotes_path, notice: "Quote was successufully destroyed"} 
            format.turbo_stream do
                flash.now[:alert] = "Quote was successufully destroyed."
            end
        end
    end

    private

        def set_quote
            @quote = current_company.quotes.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:name)
        end

end
