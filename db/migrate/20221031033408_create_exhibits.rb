class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charges_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :number_of_days_id, null: false
      t.timestamps
    end
  end
end
