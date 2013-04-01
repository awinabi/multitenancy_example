module ApplicationHelper
  def admin_posts_active_css
    params[:controller] == 'admin/posts' ? "active" : "non-active"
  end

  def admin_settings_active_css
    params[:controller] == 'admin/settings' ? "active" : "non-active"
  end
end
