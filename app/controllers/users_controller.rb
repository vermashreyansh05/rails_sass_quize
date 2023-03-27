class UsersController < ApplicationController
    # before_action :authentication,  :only => [:index]
    def index
        @users = User.all
        render json: @users
    end

    def show
        user = User.find(params[:id])
        if user 
            render json: user
        else
            render json: "user not found", status: 404
        end
    end
    
    def login
        @user = User.find_by_email(params[:email])
        if @user && params[:password] == @user.password
          token = encode_user_data(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         data: @user }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    def signup
        user = User.new(email: params[:email], password: params[:password], first_name: params[:first_name],last_name: params[:last_name], mobile:params[:mobile], city: params[:city], college: params[:college], school: params[:school])
        # if user is saved
        if user.save
          # we encrypt user info using the pre-define methods in application controller
          token = encode_user_data({ user_data: user.id })
          # return to user
          render json: { token: token, user: user}
        else
          # render error message
          render json: { message: "invalid credentials" }
        end
    end


    private
        def user_params
            params.require(:user).permit(User.column_names)
        end
end
