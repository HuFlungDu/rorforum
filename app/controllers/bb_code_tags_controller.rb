class BbCodeTagsController < ApplicationController
  before_filter :admin_user
  def manage
    @tags = @query = BbCodeTags.all
  end
  
  def update
    @tags = @query = BbCodeTags.all
    @tags.each do |tag|
      if params[tag.name.to_sym] != nil
        tag.enabled = true
      else
        tag.enabled = false
      end
      tag.save
    end
    flash[:success] = "BBCode tags updated"
    redirect_to admin_manage_bbcode_path
  end

  def destroy
  end

  def create
  end
  
  def admin_user
    redirect_to root_path, notice: "This action is only available to administrators" unless power_level?(3)
  end
end
