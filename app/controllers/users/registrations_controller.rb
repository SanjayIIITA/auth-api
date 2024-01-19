# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.present?
      render json: {
        status: { code: 200, message: "Signed up successfully",
          data: resource}
      }, status: :ok
    else
      render json: {
        status: { message: "Sorry user are not created successfully",
          errors: resource.errors.full_messages }
      }, status: :unprocessable_entity 
    end
  end
end  
