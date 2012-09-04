class Topic < ActiveRecord::Base
  attr_accessible :name
  belongs_to :forum
  belongs_to :user
  has_many :posts
  default_scope order: 'topics.created_at DESC'
  validates :forum_id, presence: true 
  validates :user_id, presence: true
  validates :name, presence: true 
end
