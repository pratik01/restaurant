class ApplicationController < ActionController::Base

  include TheRole::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery

  def after_sign_up_path_for(resource)
    redirect_to :admin_path
  end
end
