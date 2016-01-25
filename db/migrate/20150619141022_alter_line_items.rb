class AlterLineItems < ActiveRecord::Migration
  
  def up
  remove_column(:line_items,:price)
  end

  def down
  	add_column(:line_items,:price,:decimal)
  end
end
