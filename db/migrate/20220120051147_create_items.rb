class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price, null:false
      t.string :name, null:false
      t.text :explanation, null:false
      t.integer :category_id, null:false
      t.integer :item_condition_id, null:false
      t.integer :postage_player_id, null:false
      t.integer :postage_area_id, null:false
      t.integer :preparation_day_id, null:false
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
