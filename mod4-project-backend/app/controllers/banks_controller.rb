class BanksController < ApplicationController
    # def search
    #     url = URI("https://development.plaid.com/institutions/search")
        
    #     https = Net::HTTP.new(url.host, url.port);
    #     https.use_ssl = true
        
    #     request = Net::HTTP::Post.new(url)
    #     request["Content-Type"] = "application/json"
    #     request.body = "{\n\t\"client_id\": \"5f889cf280f4fb0012fd48a9\",\n\t\"secret\":\"a41eff3d05a029cffe42abd0b2432a\",\n\t\"country_codes\":[\"US\"],\n\t\"query\": \"chase\",\n\t\"products\": null\n}"
        
    #     response = https.request(request)
    #     banks = JSON.parse(response.read_body)
    #     render json: banks 
    # end
    
    def index
        url = URI("https://development.plaid.com/institutions/get")
        
        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true
        
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = "{\n\t\"client_id\": \"5f889cf280f4fb0012fd48a9\",\n\t\"secret\":\"a41eff3d05a029cffe42abd0b2432a\",\n\t\"country_codes\":[\"US\"],\n\t\"count\": 200,\n\t\"offset\": 0\n}"
        
        response = https.request(request)
        banks = JSON.parse(response.read_body)
        render json: banks["institutions"]
    end

    private
    def bank_params
        param.require(:bank).permit(:name)
    end
end
