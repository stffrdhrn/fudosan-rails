class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_client_role
    @current_client_role ||= current_client.try(:admin?) ? "admin" : "default"
  end
end
