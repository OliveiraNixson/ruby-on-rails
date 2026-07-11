class AddColumnSeletedToBebidas < ActiveRecord::Migration[7.1]
  def change
    add_column :bebidas, :disponible, :bool
  end
end
