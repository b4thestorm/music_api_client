class RemoveNameFromPlaylist < ActiveRecord::Migration
  def change
   remove_column :playlists, :name
  end
end
