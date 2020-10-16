class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name, :address, :account_balance, :banks, :categories, :transactions

    def account_balance
        self.object.transactions.sum{|e| e.amount}
    end

    def banks
        self.object.accounts.map{|e| e.banks}.flatten
    end

    def categories
        self.object.transactions.map{|e|e.category}
    end

    def transactions
        self.object.transactions
    end
    
end