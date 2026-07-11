class CreateBebidas < ActiveRecord::Migration[7.1]
  def change
    create_table :bebidas do |t|
      t.string :name
      t.float :price
      t.float :volume

      t.timestamps
    end
  end
end
