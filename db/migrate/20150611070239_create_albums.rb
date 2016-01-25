class CreateAlbums < ActiveRecord::Migration
 def up
    create_table :albums do |t|
			t.string "title",:null=>false
      t.string "artist_old",:null=>false
      t.datetime "release_date",:null=>false
      t.string "genre",:null=>false
      t.string "image_path"
      t.integer "artist_id"
      t.timestamps
    end
  end

  def down
			drop_table :albums
  end
end
