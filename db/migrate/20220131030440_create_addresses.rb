class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null:false
      t.integer :postage_area_id, null:false
      t.string :municipalities, null:false
      t.string :street_number, null:false
      t.string :building_name
      t.string :telephone_number, null:false
      t.references :order, foreign_key:true

      t.timestamps
    end
  end
end