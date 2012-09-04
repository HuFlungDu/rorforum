class BbCodeTagsController < ApplicationController
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
end
