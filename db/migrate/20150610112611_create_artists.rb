class CreateArtists < ActiveRecord::Migration
  def up
    create_table :artists do |t|
			t.string "name",:null=>false
			t.date "active_year",:null=>false
			t.text "biography"			
      t.timestamps
    end
  end

  def down
  	drop_table :artists
  end
end
