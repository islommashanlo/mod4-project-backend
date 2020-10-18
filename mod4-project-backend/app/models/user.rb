class User < ApplicationRecord
# -----------------------------------------------------------------------------------
    has_many :transactions
    has_many :accounts
    has_many :banks, through: :accounts, dependent: :destroy
# -----------------------------------------------------------------------------------
    validates :username, uniqueness: { case_sensitive: false }, length: {maximum: 50}
# -----------------------------------------------------------------------------------

    def self.api_call(url)
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.read_body)    
    end

end
