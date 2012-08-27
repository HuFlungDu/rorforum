class AddIndexToForumsNavId < ActiveRecord::Migration
  def change
    add_index :forums, :forum_nav_id, unique: true
  end
end
