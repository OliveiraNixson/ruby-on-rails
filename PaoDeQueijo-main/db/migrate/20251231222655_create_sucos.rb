class CreateSucos < ActiveRecord::Migration[7.1]
  def change
    create_table :sucos do |t|
      t.string :name

      t.timestamps
    end
  end
end
