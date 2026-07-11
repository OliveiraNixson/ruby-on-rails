class CreateLineItemDates < ActiveRecord::Migration[7.1]
  def change
    create_table :line_item_dates do |t|
      t.references :quote, null: <div class="flex flex-col items-center justify-center text-center py-16 px-6 bg-gray-50 rounded-2xl border border-gray-200 shadow-sm">
  
      <p class="text-lg font-medium text-gray-600 mb-4">
        You don't have any quotes yet!
      </p>
    
      <%= link_to "Add Quote",
          new_quote_path,
          class: "inline-block px-5 py-2.5 bg-blue-600 text-white font-semibold rounded-lg shadow hover:bg-blue-700 transition duration-200"
      %>
    
    </div>false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end

    add_index :line_item_dates, [:date, :quote_id], unique: true
    add_index :line_item_dates, :date
  end
end
