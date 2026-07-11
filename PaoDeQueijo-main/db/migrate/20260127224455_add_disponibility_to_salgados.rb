class AddDisponibilityToSalgados < ActiveRecord::Migration[7.1]
  def change
    add_column :salgados, :disponibility, :boolean
  end
end
