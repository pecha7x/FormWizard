class AdminsController < ApplicationController
  layout "admin"

  before_filter :authenticate_user!

  def index
    if current_user.admin
      redirect_to :controller=>'companies', :action => 'index'
    else
      @bunches = BunchType.all
    end
  end

end