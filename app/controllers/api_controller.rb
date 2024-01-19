class ApiController < ApplicationController
    before_action :authenticate_user! # Only authenticate user are allowed to signin
    # rescure here from cancancan access denied error 500 and raise error
    rescue_from CanCan::AccessDenied do |exception|
        render json: {warning: exception, status: 'Authorization failed' }
    end

end