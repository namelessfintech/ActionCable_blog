class ApplicationController < ActionController::Base

  # how to trigger my exception catchers
rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected

  def resource_not_found
    # this will be overidden in my individual controllers
  end
end
