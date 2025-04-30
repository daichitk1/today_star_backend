
module Api
    module V1
        class DailyReflectionsController < ApplicationController
        before_action :set_daily_reflection, only: %i[ show update destroy ]

        # GET /DailyReflections
        def index
            @daily_reflections = DailyReflection.where(email: params[:email]).order(created_at: :desc)


            render json: @daily_reflections
        end

        # GET /DailyReflections/1
        def show
            render json: @daily_reflection
        end

        # POST /DailyReflections
        def create
            @daily_reflection = DailyReflection.new(daily_reflection_params)
            if DailyReflection.where(created_at: Time.zone.today.all_day).where(email: params[:email]).length == 0 && @daily_reflection.save
                render json: @daily_reflection, status: :created
            end
        end

        # PATCH/PUT /DailyReflections/1
        def update
            if @daily_reflection.update(daily_reflection_params)
            render json: @daily_reflection
            else
            render json: @daily_reflection.errors, status: :unprocessable_entity
            end
        end

        # DELETE /DailyReflections/1
        def destroy
            @daily_reflection.destroy!
        end

        def today_reflection

            @today_reflection =  DailyReflection.where(created_at: Time.zone.today.all_day).where(email: params[:email])
            render json: @today_reflection
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_daily_reflection
                @daily_reflection = DailyReflection.find(params.expect(:id))
            end

            # Only allow a list of trusted parameters through.
            def daily_reflection_params
                params.require(:daily_reflection).permit(:comment,:rating,:email)
            end
        end
    end
end

