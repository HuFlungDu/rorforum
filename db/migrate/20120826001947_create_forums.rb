class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.integer :parent
      t.integer :required_power_level_to_view
      t.integer :required_power_level_to_post
      t.integer :forum_nav_id

      t.timestamps
    end

  end
end
