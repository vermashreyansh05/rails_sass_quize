class QuizeDataController < ApplicationController
    # before_action :authentication

    def index
        @quize_data = QuizeData.all
        render json: @quize_data, status: 200
    end

    def submit
        @choice = params["quize"]["choice"]
        user_token = params["token"]
        render json: [@choice, user_token], status: 200
    end


    private
        def quize_params
            params.require(:quize).permit(QuizeData.column_names)
        end
end
