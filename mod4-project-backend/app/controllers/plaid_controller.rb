class PlaidController < ApplicationController


    def link_token
        client = Plaid::Client.new(env: :development, client_id: '5f889cf280f4fb0012fd48a9', secret: 'a41eff3d05a029cffe42abd0b2432a') do |builder|
        Plaid::Client.build_default_connection(builder)
        builder.options[:timeout] = 60*20    # 20 minutes
        end

        user = User.find_by(username: params[:user_id])
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

    def access_token
        byebug
        client = Plaid::Client.new(env: :development,
            client_id: '5f889cf280f4fb0012fd48a9',
            secret: 'a41eff3d05a029cffe42abd0b2432a')
        access_token = nil
        post '/get_access_token' do
        exchange_token_response =
        client.item.public_token.exchange(params['public_token'])
        access_token = exchange_token_response['access_token']
        item_id = exchange_token_response['item_id']
        puts "access token: #{access_token}"
        puts "item ID: #{item_id}"
        content_type :json
        exchange_token_response.to_json
        end
    end

    private

    def user_params
        param.require(:user).permit(:user_id)
    end

end
