class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show, :user]

    def create
        # starts the create process for the user in the database
        user = User.create(
            username: params["username"],
            password: params["password"]
        )
        # check if there are any errors creating that user
        if user.errors.any?
            render json: {errors: user.errors}
        else
            render json: user
        end
    end

    def user
        if @user 
            @user
        else 
            render status: :unauthorized
        end
    end

    def show
        render json: @user
    end

    
end
