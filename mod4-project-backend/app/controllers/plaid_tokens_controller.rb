class PlaidTokensController < ApplicationController
    def access_token
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

    private

    def token_params
        param.require(:plaid_token).permit(:user_id, :public_token)
    end
end
