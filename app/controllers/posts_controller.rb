class PostsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic])
    @forum = @topic.forum
    @post = @query = Post.new
  end
  
  def create
    @topic = Topic.find(params[:topic])
    @post = @query = Post.new(params[:post])
    @post.topic = @topic
    @post.user = current_user
    if @post.save
      flash[:success] = "Post created!"
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def edit
  end
  
  def has_topc
    if !params[:topic]
      redirect_to root_path
    end
  end
  
  def check_forum_privileges
    @topic = Topic.find(params[:topic])
    @forum = @topic.forum
    redirect_to root_path, notice: "The forum you want to make this topic in either does not exist or you do not have permission to post in it." unless @forum and power_level?(@forum.required_power_level_to_post)
  end
end
