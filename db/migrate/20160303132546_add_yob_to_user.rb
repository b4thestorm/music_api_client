class AddYobToUser < ActiveRecord::Migration
  def change
   add_column :users, :yob, :integer
  end
end
