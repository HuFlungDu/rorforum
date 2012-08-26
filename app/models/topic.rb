class Topic < ActiveRecord::Base
  attr_accessible :forum_id, :name
  belongs_to :forum
  has_many :posts
  validates :forum_id, presence: true 
end
