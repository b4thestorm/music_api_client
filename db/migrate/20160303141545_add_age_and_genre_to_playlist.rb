class AddAgeAndGenreToPlaylist < ActiveRecord::Migration
  def change
   add_column :playlists, :age, :integer
   add_column :playlists, :genre, :string
  end
end
