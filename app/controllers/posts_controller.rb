class PostsController < ApplicationController
  before_filter :has_topic, only: [:new]
  before_filter :signed_in_user, only: [:new, :edit, :update]
  before_filter :check_forum_privileges, only: [:new, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  
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
    @post = @query = Post.find(params[:id])
  end
  def update
    @post = @query = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
    redirect_to @post.topic
    else
      render 'edit'
    end
  end
  
  def has_topic
    if !params[:topic]
      redirect_to root_path
    end
  end
  
  def check_forum_privileges
    @post = Post.find(params[:id])
    @forum = @post.topic.forum
    redirect_to root_path, notice: "You do not have permission to post in this forum or it does not exist." unless @forum and power_level?(@forum.required_power_level_to_post)
  end
  
  def signed_in_user
    store_location
    redirect_to login_url, notice: "Please sign in." unless signed_in?
  end
  
  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(root_path) unless current_user?(@user)
  end
  
end
