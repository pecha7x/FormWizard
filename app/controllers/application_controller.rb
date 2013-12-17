class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :scope_current_company, if: :not_controllers
  after_filter :store_location

  def not_controllers
    return false if self.controller_name == "companies" or self.controller_name == "main"
    true
  end

  def after_sign_in_path_for(resource)
    admins_path
  end

  private
  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end

  def redirect_back_or_to(alternate)
    redirect_to(session[:return_to] || alternate)
    clear_stored_location
  end

  protected

  def current_company
    Company.find_by_subdomain request.subdomain
  end
  helper_method :current_company

  def scope_current_company
    if current_company.blank?
      Company.current_id = nil
    else
      Company.current_id = current_company.id
    end
  end
end
