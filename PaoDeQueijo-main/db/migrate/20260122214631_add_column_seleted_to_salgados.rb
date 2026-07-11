class AddColumnSeletedToSalgados < ActiveRecord::Migration[7.1]
  def change
    add_column :salgados , :disponible , :bool
  end
end
