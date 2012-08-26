class AddPowerLevelToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :power_level, :integer, default: 0
  end
end