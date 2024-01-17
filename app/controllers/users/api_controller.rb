class ApiController < ApplicationController
    before_action :authenticate_user! # Only authenticate user are allowed to signin
end