class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :post_number, null:false
      t.string :prefecture, null:false
      t.string :town, null:false
      t.string :address, null:false
      t.string :telephone, null:false
      t.references :buying_item, null: false, foreign_key:true

      t.timestamps
    end
  end
end
