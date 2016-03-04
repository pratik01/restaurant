class ApplicationController < ActionController::Base

  include TheRole::Controller
  layout :set_layout
  #before_filter :configure_devise_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery

  def after_sign_up_path_for(resource)
    redirect_to :admin_path
  end

  private

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit!
    end
  end

  def set_layout
    @scope = request.fullpath.to_s.split("/")
    if @scope[1] == "owner"
      "owner"
    else
      "application"
    end
  end
end
