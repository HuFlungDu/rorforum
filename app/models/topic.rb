class Topic < ActiveRecord::Base
  attr_accessible :name
  belongs_to :forum
  belongs_to :user
  has_many :posts
  validates :forum_id, presence: true 
  validates :user_id, presence: true
  validates :name, presence: true 
end
