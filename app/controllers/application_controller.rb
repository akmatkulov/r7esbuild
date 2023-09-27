# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Access helper on all controllers
  include Pagy::Backend
  include SessionsHelper
end
