class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|

      t.timestamps
      t.string :name
    end
  end
end
