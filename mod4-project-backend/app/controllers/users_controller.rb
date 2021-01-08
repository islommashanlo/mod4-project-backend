class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :edit, :destroy]
    before_action :authorized, only: [:update, :edit, :destroy, :profile]
    skip_before_action :authorized, only: [:create, :index, :show]


    def show
        @user
        render json: @user
    end

    def index
        users = User.all
        render json: users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def update
        @user.update(user_params)
        render json: @user
    end
    def create
        @user = User.create(user_params)
        @user.setup_user
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end


    private 

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :address, :password, :password_confirmation)
    end
end
