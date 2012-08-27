class AddDataToPost < ActiveRecord::Migration
  def change
    add_column :posts, :data, :string 
  end
end
