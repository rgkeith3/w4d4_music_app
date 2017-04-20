class FixAlbums < ActiveRecord::Migration[5.0]
  def change
    add_index :albums, :band_id
    add_column :albums, :album_type, :string, null: false
  end
end
