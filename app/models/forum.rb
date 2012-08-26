class Forum < ActiveRecord::Base
  attr_accessible :name, :parent, :required_power_level_to_view, :required_power_level_to_post, :forum_nav_id, :description
  belongs_to :forum
  has_many :forums
end
