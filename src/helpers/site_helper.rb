module SiteHelper
  def full_page_title
    [@page_title, @site_name].compact.join(@title_delimiter)
  end

  def title_header
    title = current_page == '/index.html' ? @site_name : full_page_title
    "<div id=\"title\" title=\"#{title}\"><h1>#{title}</h1></div>"
  end
end
