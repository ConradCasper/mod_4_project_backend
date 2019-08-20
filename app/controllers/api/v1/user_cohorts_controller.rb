class Api::V1::UserCohortsController < ApplicationController

    def index
        @user_cohorts = UserCohort.all
        render json: @user_cohorts
    end

    def show
        @user_cohort = UserCohort.find_by(id: params[:id])
        render json: @user_cohort
    end

    def new

    end

    def create
        @user_cohort = User_Cohort.create(user_cohort_params)
        if @user_cohort.valid?
            render json: {user_cohort: @user_cohort}, status: :created
        else
            render json: { error: 'failed to create user_cohort' }, status: :not_acceptable
        end
    end

    def edit
        @user_cohort = UserCohort.find_by(id: params[:id])
        render json: @user_cohort
    end

    def update
        @user_cohort = Cohort.find_by(id: params[:id])
        @user_cohort.user_id = user_cohort_params[:user_id]
        @user_cohort.cohort_id = user_cohort_params[:cohort_id]
        @user_cohort.save
        flash[:success] = "User Cohort Updated Successfully!"
        redirect_to `/api/v1/user_cohorts/#{@user_cohort.id}`
    end

    def delete
        user_cohort = UserCohort.find_by(id: params[:id])
        user_cohort.destroy
        flash[:warning] = “User Cohort Successfully Deleted!”
        redirect_to `/api/v1/user_cohorts`
    end


    private

    def user_cohort_params
        params.require(:user_chort).permit(:user_id, :cohort_id)
    end

end
