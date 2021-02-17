class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,          null: false
      t.integer :prefecture_id,     null: false
      t.string :prefecture_city,    null: false
      t.string :prefecture_block,   null: false
      t.string :prefecture_buildin
      t.string :phone_number,       null: false
      t.references :order,          foreign_key: true
      t.timestamps
    end
  end
end
