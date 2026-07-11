class CreateSalgados < ActiveRecord::Migration[7.1]
  def change
    create_table :salgados do |t|
      t.string :name
      t.float :price
      t.string :mass
      t.boolean :active

      t.timestamps
    end
  end
end
