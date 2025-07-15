
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
