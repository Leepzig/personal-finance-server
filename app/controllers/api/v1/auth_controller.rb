class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    #Do we need to do anything to logout?
    def create
        @user = User.find_by_email(user_login_params[:email])
        if @user&.authenticate(user_login_params[:password])
            #above we're authenticating the user
            #then below we're creating the token
            token = encode_token({user_id:@user.id})
            #then sending the token back in a hash
            render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    def get_current_user
        current_user
        if @user
            render json: @user, status: :ok
        else
            render json: {errors:"Please sign in or signup if you don't already have an account."}
        end
    end

    private

    def user_login_params
        # params { user: {username: 'Chandler Bing', password: 'hi' } }
        params.permit(:email, :password)
    end
end
