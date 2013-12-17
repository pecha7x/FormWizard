class MainController < ApplicationController
  before_filter :scope_current_company
  layout "main"
  def index
  end

private
  def current_company
    Company.find_by_subdomain request.subdomain
  end
  helper_method :current_company

  def scope_current_company
    if current_company.blank?
      Company.current_id = nil
    else
      Company.current_id = current_company.id
      redirect_to action: "new", controller: "polls", bunch_type_id: BunchType.first.id
    end
  end
end
