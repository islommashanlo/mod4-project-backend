class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.string :name
      t.string :amount
      t.datetime :t_date
      t.integer :category_id
      t.integer :transaction_type_id
    end
  end
end
