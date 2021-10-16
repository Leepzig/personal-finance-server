class Api::V1::UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            render json:user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: 422
        end
    end

    def show
        user = User.find_by_id(:params[:id])
        if user
            render json: user
        else
            render json: { error: "User does not exist"}, status: :not_found
        end
    end

    private
        def user_params
            params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
