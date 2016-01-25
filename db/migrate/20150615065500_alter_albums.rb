class AlterAlbums < ActiveRecord::Migration
  def up
  add_column(:albums,"price",:decimal,:after=>"release_date")
  remove_column(:albums,:artist_old)
  end

  def down 
  	remove_column(:albums,:price)
  	add_column(:albums,:artist_old,:string)
  end
end
