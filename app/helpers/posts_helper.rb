module PostsHelper
  def tanslate_to_bbcode postData
    postData.bbcode_to_html.html_safe
  end
end
