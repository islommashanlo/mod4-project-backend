class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :edit, :destroy]
    before_action :authorized, only: [:update, :edit, :destroy]
    skip_before_action :authorized, only: [:create, :index, :show]

    def access_token
        byebug
        client = Plaid::Client.new(env: :development,
            client_id: '5f889cf280f4fb0012fd48a9',
            secret: 'a41eff3d05a029cffe42abd0b2432a')
        exchange_token_response = client.item.public_token.exchange(params['public_token'])
        access_token = exchange_token_response.access_token

        auth_response = client.auth.get(access_token)
        auth = auth_response.auth
    end

    def link_token
        client = Plaid::Client.new(env: :development, client_id: '5f889cf280f4fb0012fd48a9', secret: 'a41eff3d05a029cffe42abd0b2432a') do |builder|
        Plaid::Client.build_default_connection(builder)
        builder.options[:timeout] = 60*20    # 20 minutes
        end

        user = User.find(1)
        client_user_id = user.id

        link_token_response = client.link_token.create(
            user: { client_user_id: client_user_id.to_s },
            client_name: 'My app',
            products: %w[auth transactions],
            country_codes: ['US'],
            language: 'en'
        )

        link_token = link_token_response.link_token
        render json: link_token_response
    end


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

    def create
        @user = User.create(user_params)
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
