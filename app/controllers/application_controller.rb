class ApplicationController < ActionController::Base

  # how to trigger my exception catchers
rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  private

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end

  helper_method :current_room

  protected

  def resource_not_found
    # this will be overidden in our individual controllers
  end
end
