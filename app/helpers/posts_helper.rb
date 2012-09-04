module PostsHelper
  def sanitize_and_bb postData
    data = Sanitize.clean(postData,:elements => %w[a abbr b blockquote br cite code dd dfn dl dt em i kbd li mark ol p pre
                                                   q s samp small strike strong sub sup time u ul var button])
    bbtags = BbCodeTags.where("custom = false and enabled = true").map do |tag|
      tag.enable_symbol.to_sym
    end
    
    data.bbcode_to_html({}, false, :enable, *bbtags).html_safe
  end
end
