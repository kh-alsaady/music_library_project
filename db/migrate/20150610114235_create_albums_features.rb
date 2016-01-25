class CreateAlbumsFeatures < ActiveRecord::Migration
  def up
    create_table :albums_features, {:id=>false} do |t|
	    t.references :album
	    t.references :feature
    end
  end

  def down
  	drop_table :albums_features
  end
end

