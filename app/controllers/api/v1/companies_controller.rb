class Api::V1::CompaniesController < ApiController
    load_and_authorize_resource
    before_action :set_company, only: [:show, :update, :destroy]

    def index
        # @companies = Company.all
        @companies = Company.accessible_by(current_ability)
        #List only signin user
        # @companies = current_user.companies 
        render json: @companies, status: :ok
    end

    def show 
        #@current_user = current_user.companies
        render json: @company, status: :ok
    end

    def create
        @company = Company.new(company_params)
        # @company = current_user.companies.new(company_params)

        if @company.save
            render json: @company, status: :ok
        else 
            render json: {data: @company.errors.full_messages, status: "failed"},
            status: :unprocessable_entity
        end    
    end

    def update
        if @company.update(company_params)
            render json: @company, status: :ok
        else  
            render json: {data: @company.errors.full_messages, status: "failed"},
            status: :unprocessable_entity
        end    
    end

    def destroy
        if @company.destroy 
            render json: {data: "Company deleted successully", status: "Success"},
            status: :ok
        else  
            render json: {data: "Unable to destroy", status: "Failed"},
            status: :unprocessable_entity 
        end
    end

    private

    def set_company
        @company = current_user.companies.find(params[:id])

    rescue  ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized 
    end

    def company_params
        params.require(:company).permit(:name, :address, :establish_year, :user_id)
    end    
end