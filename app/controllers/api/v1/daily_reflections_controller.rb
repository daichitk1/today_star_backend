
module Api
    module V1
        class DailyReflectionsController < ApplicationController
        before_action :set_daily_reflection, only: %i[ show update destroy ]

        # GET /DailyReflections
        def index
            @daily_reflections = DailyReflection.all

            render json: @daily_reflections
        end

        # GET /DailyReflections/1
        def show
            render json: @daily_reflection
        end

        # POST /DailyReflections
        def create
            @daily_reflection = DailyReflection.new(daily_reflection_params)

            if @daily_reflection.save
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

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_DailyReflection
                @daily_reflection = DailyReflection.find(params.expect(:id))
            end

            # Only allow a list of trusted parameters through.
            def daily_reflection_params
                params.require(:daily_reflection).permit(:comment,:rating)
            end
        end
    end
end

