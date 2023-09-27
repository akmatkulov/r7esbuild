module ApplicationHelper
  include Pagy::Frontend
   # Return full title
   def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    return page_title + ' | ' + base_title if page_title.present?
    return base_title
  end
end
