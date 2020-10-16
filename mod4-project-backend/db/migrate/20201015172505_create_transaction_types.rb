class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|

      t.timestamps
      t.string :name
    end
  end
end
