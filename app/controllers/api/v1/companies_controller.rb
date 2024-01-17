class Api::V1::CompaniesController < ApiController
    before_action :set_company, only: [:show]

    def index
        #@current_user = Companies.all
        @current_user = current_user.companies #List only signin user
    end

    def show 
        #@current_user = current_user.companies
        # render json: @company, status: :ok
    end

    private

    def set_company
        @company = current_user.companies.find(params[:id])

    rescue  ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized 
    end
end