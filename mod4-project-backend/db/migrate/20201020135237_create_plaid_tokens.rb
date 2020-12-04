class CreatePlaidTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :plaid_tokens do |t|

      t.timestamps
      t.integer :user_id
      t.string :public_token
    end
  end
end
