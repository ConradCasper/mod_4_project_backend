class Api::V1::CohortsController < ApplicationController
        skip_before_action :authorized, only: [:index, :show]
    def index
        @cohorts = Cohort.all
        render json: @cohorts.to_json( include: [:users])
    end

    def show
        @cohort = Cohort.find_by(id: params[:id])
        render json: @cohort.to_json( include: [:users])
    end

    def new

    end

    def create
        @cohort = Cohort.create(cohort_params)
        if @cohort.valid?
            render json: { cohort: @cohort }, status: :created
        else
            render json: { error: 'failed to create cohort' }, status: :not_acceptable
        end
    end

    def edit
        @cohort = Cohort.find_by(id: params[:id])
        render json: @cohort
    end

    def update
        @cohort = Cohort.find_by(id: params[:id])
        @cohort.offical_name = cohort_params[:offical_name]
        @cohort.slogan = cohort_params[:slogan]
        @cohort.start_date = cohort_params[:start_date]
        @cohort.location = cohort_params[:location]
        @cohort.end_date = cohort_params[:end_date]
        @cohort.image = cohort_params[:image]
        @cohort.save
        flash[:success] = "Cohort Updated Successfully!"
        redirect_to `/api/v1/cohorts/#{@cohort.id}`
    end

    def delete
        cohort = Cohort.find_by(id: params[:id])
        cohort.destroy
        flash[:warning] = “Cohort Successfully Deleted!”
        redirect_to `/api/v1/cohorts`
    end


    private

    def cohort_params
        # params.require(:cohort) ####### nesting was not needed here
        params.require(:cohort).permit(:official_name, :slogan, :start_date, :location, :image, :course)
    end



end
