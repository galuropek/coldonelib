module ApplicationHelper
  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page
    css_class = current_page == title ? 'fw-bold text-danger-emphasis' : 'fw-medium'
    options[:class] = options[:class].present? ? options[:class] + " #{css_class}" : css_class
    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/navbar', locals: { current_page: current_page }
  end

  def extended_page_title(page_title = '')
    base_title = 'ColdOneLib'
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end
end
