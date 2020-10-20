class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name, :address, :account_balance, :banks, :transaction_types, :budgets, :credit_categories, :debit_categories, :transactions, :projected

    def account_balance
        self.object.transactions.select{|e|e.transaction_type_id == 1}.sum{|e|e.amount} - self.object.transactions.select{|e|e.transaction_type_id == 2}.sum{|e|e.amount}
    end

    def banks
        Bank.all
    end

    def credit_categories
        self.object.transactions.select{|e|e.transaction_type.id == 1}.map{|e|e.category}.uniq
    end

    def debit_categories
        self.object.transactions.select{|e|e.transaction_type.id == 2}.map{|e|e.category}.uniq
    end

    def transactions
        self.object.transactions
    end

    def budgets
        self.object.budgets
    end

    def transaction_types
        TransactionType.all
    end

    def projected
        all_transacts = self.object.transactions.map{|e|e.name}.uniq
        all_transacts.map{|e|self.object.linear_regression(e,[1,2,3,4,5])}
    end

end