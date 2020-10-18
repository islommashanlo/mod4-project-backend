class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.string :name
      t.float :amount
      t.string :t_date
      t.integer :category_id
      t.integer :transaction_type_id
      t.integer :user_id
    end
  end
end
