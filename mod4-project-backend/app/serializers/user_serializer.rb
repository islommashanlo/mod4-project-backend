class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name, :address, :account_balance, :banks, :transaction_types, :budgets, :credit_categories, :debit_categories, :transactions, :projected, :transacts_by_period

    def account_balance
        self.object.transactions.select{|e|e.transaction_type_id == 1}.sum{|e|e.amount} - self.object.transactions.select{|e|e.transaction_type_id == 2}.sum{|e|e.amount}
    end

    def banks
        Bank.all
    end

    def credit_categories
        self.object.categories.select{|e|e.transaction_type.id == 1}
    end

    def debit_categories
        self.object.categories.select{|e|e.transaction_type.id == 2}
    end

    def transactions
        self.object.transactions.sort{|a,b| b.t_date <=> a.t_date}
    end

    def transacts_by_period
        all_dates = self.object.transactions.map{|e|e.t_date.split("-").first(2)}.uniq
        t_by_period = all_dates.map{|e|{date: "#{e.join("-")}", values: self.object.transactions.select{|t|t.t_date.split("-").first(2).join("-") == e.join("-") }.flatten.map{|x|{category: x.category, total: x.category.transactions.select{|g|g.user_id==self.object.id && g.t_date.split("-").first(2).join("-") == e.join("-")}.sum{|ele|ele.amount}, transactions: x.category.transactions.select{|y|y.user_id==self.object.id && y.t_date.split("-").first(2).join("-") == e.join("-")}} }.uniq } }
        t_by_period.reverse
    end

    def budgets
        self.object.budgets.sort{|e|e.category_id}.reverse
    end

    def transaction_types
        TransactionType.all
    end

    # def geo_location
    #     User.api_call("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.object.address}&key=#{ENV["MAPS_KEY"]}")['results'][0]['geometry']['location']
    # end 

    # def q_address
    #     self.object.address.tr(" ", "+")
    # end 
    
    def projected
        all_transacts = self.object.categories.select{|c|c.user_id == self.object.id && c.transaction_type_id==2}.map{|e|e.name}.uniq
        all_transacts.map{|e|self.object.linear_regression(e,5)}
    end

end