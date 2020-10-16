class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|

      t.timestamps
      t.string :name
      t.float :amount
      t.integer :category_id
      t.integer :user_id
    end
  end
end
