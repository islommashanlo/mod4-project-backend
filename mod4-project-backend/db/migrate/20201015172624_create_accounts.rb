class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|

      t.timestamps
      t.string :user_id
      t.string :bank_id
    end
  end
end
