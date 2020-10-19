class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :password_digest
    end
  end
end
