class AddCompanyIdToQuotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :quotes, :company, foreign_key: true, null: true
  end
end
