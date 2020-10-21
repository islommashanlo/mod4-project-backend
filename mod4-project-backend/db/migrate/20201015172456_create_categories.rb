class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :name
      t.integer :user_id
      t.integer :transaction_type_id
    end
  end
end
