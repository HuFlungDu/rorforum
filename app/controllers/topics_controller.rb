class TopicsController < ApplicationController
  before_filter :has_forum, only: [:new]
  before_filter :check_forum_privileges, only: [:new, :edit]
  before_filter :check_forum_privileges_show, only: [:show]
  before_filter :check_topic_owner, only: [:edit]
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page])
  end
  
  

  def new
    @forum = Forum.find_by_forum_nav_id(params[:forum])
    @topic = @query = @forum.topics.new
    @post = @topic.posts.build 
  end
  
  def create
    @forum = @query = Forum.find_by_forum_nav_id(params[:forum])
    @topic = Topic.new(:name => params[:topic][:name])
    @topic.forum = @forum
    @post = Post.new(data: params[:topic][:posts][:data])
    @post.topic = @topic
    @topic.user = current_user
    @post.user = current_user
    
    if @topic.valid? and @post.valid?
      @topic.save
      @post.save
      flash[:success] = "Topic Created!"
      redirect_to topic_path(@topic)
    else
      @query = @post
      render 'new'
    end
  end

  def edit
  end
  
  def has_forum
    if !params[:forum]
      redirect_to root_path
    end
  end
  
  def check_forum_privileges_show
    @forum = Topic.find(params[:id]).forum
    redirect_to root_path, notice: "This topic doesn't exist or you don't have permission to view it" unless @forum and power_level?(@forum.required_power_level_to_view)
  end
  
  def check_forum_privileges
    @forum = Forum.find_by_forum_nav_id(params[:forum])
    redirect_to root_path, notice: "The forum you want to make this topic in either does not exist or you do not have permission to post in it." unless @forum and power_level?(@forum.required_power_level_to_post)
  end
  def check_topic_owner
    @topic = Topic.find(params[:id])
    redirect_to root_path, notice: "You can't edit a topic that you didn't create" unless owns_topic?(@topic)
  end
end
