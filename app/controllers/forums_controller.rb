class ForumsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :admin]
  before_filter :admin_user, only: [:new, :edit, :admin, :manage, :destroy]
  before_filter :check_power_level, only: [:show]

  def index
    @forum = @query = Forum.find_by_id(1)
    @topics = @forum.topics.paginate(page: params[:page])
  end

  def show
    @forum = @query = Forum.find_by_forum_nav_id(params[:id])
    @topics = @forum.topics.paginate(page: params[:page])
  end

  def new
  	@forum = @query = Forum.new
  end
  
  def create
    @forum = @query = Forum.new(params[:forum])
    if @forum.save
      flash[:success] = "Forum Created!"
      redirect_to admin_path
    else
      render 'new'
    end
  end
  
  def manage
    @forums = Forum.where("id != 1")
  end
  
  def destroy
    Forum.find(params[:id]).destroy
    flash[:success] = "Forum removed."
    redirect_to manage_forums_path
  end

  def signed_in_user
  	store_location
    redirect_to login_url, notice: "Please sign in." unless signed_in?
  end

  def admin_user
    redirect_to root_path, notice: "This action is only available to administrators" unless power_level?(3)
  end
  
  def check_power_level
    redirect_to root_path, notice: "This forum doesn't exist or you do not have permission to view it" unless power_level?(Forum.find_by_forum_nav_id(params[:id]).required_power_level_to_view)
  end
end
