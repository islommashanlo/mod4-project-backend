class CreateAddressConverters < ActiveRecord::Migration[6.0]
  def change
    create_table :address_converters do |t|

      t.timestamps
      t.string :address
      t.float :langt
      t.float :longt
    end
  end
end
