class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
			t.integer "invoice_number"
			t.integer "customer_id"
      t.timestamps
    end
  end

  def down
		drop_table "orders"
  end
end
