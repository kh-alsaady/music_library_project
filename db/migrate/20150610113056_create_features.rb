class CreateFeatures < ActiveRecord::Migration
  def up
    create_table :features do |t|
		t.string "name",:null=>false
	    t.timestamps
    end
  end
  
  def down
  	drop_table :features
  end
end
