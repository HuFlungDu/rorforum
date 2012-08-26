class Post < ActiveRecord::Base
  attr_accessible :topic_id, :user_id
  belongs_to :topic
  belongs_to :user
  default_scope order: 'posts.created_at ASC'
  validates :user_id, presence: true 
  validates :topic_id, presence: true 
end
