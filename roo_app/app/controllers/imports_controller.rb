class ImportsController < ApplicationController

    def index 

    end

    def create
        file = params[:file]
        if file.present?
            sheet = Roo::Spreadsheet.open(file.path)
            header = sheet.row(1)
            (2..sheet.last_row).each do |row_number|
                row = Hash[[header, sheet.row(row_number)].transpose]
                User.create!(name: row['name'], email: row['e-mail'])
            end
            flash[:notice] = "Planilha importada com sucesso! #{User.count} usuarios adicionados." 
        else
            flash[:alert] = "Por favor, selecione um arquivo"
        end
        redirect_to root_path
    end

    private

    def set_import 

    end

    def import_params

    end
end
