class CreateLineItems < ActiveRecord::Migration
  def up
    create_table :line_items do |t|
			t.integer "album_id"
			t.integer "order_id"
			t.integer "quantity"
			t.decimal "price"
      t.timestamps
    end
  end
  
  def down
  	drop_table :line_items
  end
end
