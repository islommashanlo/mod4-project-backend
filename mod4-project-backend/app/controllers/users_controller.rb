class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :edit, :destroy]

    def show
        @user
        render json: @user
    end

    def index
        users = User.all
        render json: users
    end

    def create
        new_user = User.create(user_params)
        render json: new_user
    end

    def update
        @user.update(user_params)
        render json: @user
    end

    private 

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :address)
    end
end
