class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def create
        @user = User.new(user_params)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: 422
        end
    end

    def show
        user = User.find_by_id(params[:id])
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
