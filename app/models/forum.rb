class Forum < ActiveRecord::Base
  attr_accessible :name, :parent, :required_powerlevel_to_view, :required_pwerlevel_to_post, :forum_nav_id
  belongs_to :forum
  has_many :forums
end
