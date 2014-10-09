class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :plant_name
      t.string :height
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.string :plant_type
      t.attachment :image

      t.timestamps
    end
  end
end
