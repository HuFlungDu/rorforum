class ForumsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :admin]
  before_filter :admin_user, only: [:new, :edit, :admin]

  def index
  end

  def show
    @forum = Forum.find_by_forum_nav_id(params[:id])
    @query = @forum
  end

  def new
  	@forum = Forum.new
  	@query = @forum
  end

  def signed_in_user
  	store_location
    redirect_to login_url, notice: "Please sign in." unless signed_in?
  end

  def admin_user
    redirect_to root_path, notice: "This action is only available to administrators" unless power_level?(3)
  end
end
