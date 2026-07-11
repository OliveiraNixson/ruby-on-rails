class LineItemDatesController < ApplicationController
    before_action :set_line_item_date, only: [:edit, :destroy, :update]
    before_action :set_quote


    def new
        @line_item_date = @quote.line_item_dates.build
    end

    def create
        @line_item_date = @quote.line_item_dates.build(line_item_date_params)
        respond_to do |format|
            if @line_item_date.save
                format.html{ redirect_to quote_path(@quote), notice: "Line item was successufully created." }
                format.turbo_stream do 
                    flash.now[:notice] = "Line item was successufully created"
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
            if @line_item_date.update(line_item_date_params)
                format.html{ redirect_to quote_path(@quote), notice: "Line item was successufully updated." }
                format.turbo_stream do 
                    flash.now[:notice] = "Line item was successufully udpated"
                end
            else
                format.html { render :new, status: :unprocessable_entity }
                format.turbo_stream { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @line_item_date.destroy

        respond_to do |format| 
            format.html{
                redirect_to quote_path(@quote), notice: "Date was successfully destroyed."
            }
            format.turbo_stream{
                flash.now[:notice] = "Date was successfully destroyed."
            }
        end
        
    end

    private

    def set_quote
        @quote = current_company.quotes.find(params[:quote_id])
    end

    def set_line_item_date
        @line_item_date = LineItemDate.find(params[:id] || params[:line_item_date_id])
    end

    def line_item_date_params
        params.require(:line_item_date).permit(:id, :line_item_date_id, :quote_id, :date)
    end
end
