class Post < ActiveRecord::Base
  attr_accessible :data
  belongs_to :topic
  belongs_to :user
  default_scope order: 'posts.created_at ASC'
  validates :user_id, presence: true 
  #validates :topic_id, presence: true 
  validates :data, presence: true
end
