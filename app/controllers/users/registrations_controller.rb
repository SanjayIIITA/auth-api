# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  private

  def responed_with(resource, option={})
    if resource.present?
      render json: {
        status: { code: 200, messages: "SignedUp insuccessfully",
          data: resource}
      },status: :ok
    else
      render json: {
        status: { messages: "Sorry user are not created successfully",
          errors: resource.errors.full_messages 
        },status: :unprocessable_entity 
      }
    end
  end
end  
