
module Api
    module V1
        class DailyReflectionsController < ApplicationController
        before_action :set_DailyReflection, only: %i[ show update destroy ]

        # GET /DailyReflections
        def index
            @DailyReflections = DailyReflection.all

            render json: @DailyReflections
        end

        # GET /DailyReflections/1
        def show
            render json: @DailyReflection
        end

        # POST /DailyReflections
        def create
            @DailyReflection = DailyReflection.new(DailyReflection_params)

            if @DailyReflection.save
            render json: @DailyReflection, status: :created, location: @DailyReflection
            else
            render json: @DailyReflection.errors, status: :unprocessable_entity
            end
        end

        # PATCH/PUT /DailyReflections/1
        def update
            if @DailyReflection.update(DailyReflection_params)
            render json: @DailyReflection
            else
            render json: @DailyReflection.errors, status: :unprocessable_entity
            end
        end

        # DELETE /DailyReflections/1
        def destroy
            @DailyReflection.destroy!
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_DailyReflection
            @DailyReflection = DailyReflection.find(params.expect(:id))
            end

            # Only allow a list of trusted parameters through.
            def DailyReflection_params
            params.require(:DailyReflection).permit(:name)
            end
        end
    end
end

