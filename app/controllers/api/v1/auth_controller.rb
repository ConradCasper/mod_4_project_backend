class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]


    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenicate(user_login_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: token}, status: :accepted
        else
            render json: { message: "Invalid username or password" }, status: :unauthorized
        end
    end


    def user_login_params
        params.require(:user).permit(:password, :username)
    end



end
