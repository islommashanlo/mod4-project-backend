class User < ApplicationRecord
# -----------------------------------------------------------------------------------
    has_many :transactions
    has_many :accounts
    has_many :banks, through: :accounts, dependent: :destroy
    has_many :budgets
# -----------------------------------------------------------------------------------
    validates :username, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    has_secure_password
# -----------------------------------------------------------------------------------

    def self.api_call(url)
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.read_body)    
    end

    def linear_regression(transacts, predict_dates)
        n = self.transactions.count
        needed_transactions = self.transactions.select{|e|e.name.downcase === transacts.downcase}

        if needed_transactions.count > 1
            sum_y = needed_transactions.sum{|y|y.amount}
            sum_x = needed_transactions.sum{|x|x.id-1}
            sum_y2 = needed_transactions.sum{|y|y.amount**2}
            sum_x2 = needed_transactions.sum{|x|(x.id-1)**2}
            sum_xy = needed_transactions.sum{|y| y.amount * (y.id-1)}
            a = ((sum_y * sum_x2) - (sum_x * sum_xy)) / ((n*sum_x2) - (sum_x**2))
            b = ((n*sum_xy) - (sum_x * sum_y)) / ((n*sum_x2) - (sum_x**2))
            predicts = predict_dates.count
            last_x = needed_transactions.last.id
            y = {}
            res = []
            predicts.times do 
                last_x += 1
                y = {"#{transacts}": res.push(((last_x * b)+a).round(2))}
            end
            y
        else
            {"#{transacts}": "Transaction cannot be forecasted. Not enough data."}
        end
    end


end
