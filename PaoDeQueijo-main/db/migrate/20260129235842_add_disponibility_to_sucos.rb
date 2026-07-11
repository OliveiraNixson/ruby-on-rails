class AddDisponibilityToSucos < ActiveRecord::Migration[7.1]
  def change
    add_column :sucos, :disponibility, :boolean
  end
end
