class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|

      t.timestamps
      t.string :name
      t.integer :account_id
    end
  end
end
