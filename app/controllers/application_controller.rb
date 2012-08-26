class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :fetch_forum_info
  private
  def fetch_forum_info
    @foruminfo = Forum.find(1)
  end
end
