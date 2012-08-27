class Forum < ActiveRecord::Base
  attr_accessible :name, :parent, :required_power_level_to_view, :required_power_level_to_post, :forum_nav_id, :description
  belongs_to :forum
  has_many :forums
  has_many :topics
  validates :forum_nav_id, uniqueness: true, presence: true
  validates :name, presence: true
  validates :parent, presence: true
  validates :required_power_level_to_view, numericality: { :only_integer => true, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 3 }, presence: true 
  validates :required_power_level_to_post, numericality: { :only_integer => true, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 3 }, presence: true
  
end
