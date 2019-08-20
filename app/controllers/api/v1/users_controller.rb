class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, ]


    def index
        @users = User.all
        render json: @users.to_json( include: [:cohorts])
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user.to_json( include: [:cohorts])
    end

    def new
        
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def edit
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.username = user_params[:username]
        @user.bio = user_params[:bio]
        @user.avatar = user_params[:avatar]
        @user.location = user_params[:location]
        @user.name = user_params[:name]
        @user.project_1 = user_params[:project_1]
        @user.project_2 = user_params[:project_2]
        @user.email = user_params[:email]
        @user.github = user_params[:github]
        @user.linkedIn = user_params[:linkedIn]
        @user.twitter = user_params[:twitter]
        @user.facebook = user_params[:facebook]
        @user.save
        flash[:success] = "User Updated Successfully!"
        redirect_to `/api/v1/users/#{@user.id}`
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        flash[:warning] = “Instance Successfully Deleted!”
        redirect_to `/api/v1/users`
    end


    private



    def user_params
       params.require(:user).permit(
            :username,
            :password,
            :bio,
            :avatar,
            :location,
            :name,
            :project_1,
            :project_2,
            :email,
            :github,
            :linkedIn,
            :twitter,
            :facebook,
            :current_employer
        )
    end




end
