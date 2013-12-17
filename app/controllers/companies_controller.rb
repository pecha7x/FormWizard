class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?
  layout "company"

  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  def show
    @company= Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def new
    @company = Company.new
    respond_to do |format|
      format.html { render "companies/new" }
      format.json { render json: @company }
    end
  end

  def create
    p company_params
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new_company" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def is_admin?
    redirect_to root_path unless current_user.admin
  end

  def company_params
    params.require(:company).permit(:name, :subdomain)
  end
end
