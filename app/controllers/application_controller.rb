class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  private

  def layout_by_resource
    return "top" if devise_controller?
    return "application"
  end

  def after_sign_in_path_for(resource)
    return home_path if resource.is_a?(User)
    return x_home_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(resource)
    reset_session
    return root_path if resource == :user
    return root_path if resource == :admin
  end

end
