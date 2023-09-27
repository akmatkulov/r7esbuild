# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  # Return full title
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'
    return "#{page_title} | #{base_title}" if page_title.present?

    base_title
  end
end
