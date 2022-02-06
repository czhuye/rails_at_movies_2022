class ProductionCompaniesController < ApplicationController
  def index
    # fetch all production companies
    @production_companies = ProductionCompany.all
  end

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
end
