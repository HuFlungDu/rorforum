class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.integer :parent
      t.integer :required_powerlevel_to_view
      t.integer :required_pwerlevel_to_post
      t.integer :forum_nav_id

      t.timestamps
    end

  end
end
