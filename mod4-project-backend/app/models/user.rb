class User < ApplicationRecord
# -----------------------------------------------------------------------------------
    has_many :transactions
    has_many :accounts
    has_many :banks, through: :accounts, dependent: :destroy
    has_many :budgets
    has_many :categories
# -----------------------------------------------------------------------------------
    validates :username, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    has_secure_password
# -----------------------------------------------------------------------------------
    def linear_regression(transacts, predict_forward)
        needed_transactions = self.transactions.select{|e|e.category.name.downcase == transacts.downcase}
        n = needed_transactions.count
        if n > 1 && needed_transactions.map{|e|e.amount}.uniq.length != needed_transactions.map{|e|e.name}.length
            sum_y = needed_transactions.sum{|y|y.amount}
            sum_x = needed_transactions.sum{|x|x.regr_date}
            sum_y2 = needed_transactions.sum{|y|y.amount**2}
            sum_x2 = needed_transactions.sum{|x|(x.regr_date)**2}
            sum_xy = needed_transactions.sum{|y| y.amount * (y.regr_date)}
            a = ((sum_y * sum_x2) - (sum_x * sum_xy)) / ((n*sum_x2) - (sum_x**2))
            b = ((n*sum_xy) - (sum_x * sum_y)) / ((n*sum_x2) - (sum_x**2))
            last_x = needed_transactions.last.regr_date
            y = {}
            res = []
            predict_forward.times do 
                last_x += 30
                y = {name: "#{transacts}", values: res.push(((last_x * b)+a).round(2))}
            end
            if res.uniq.length > 1
                y
            else 
                {"#{transacts}": "Transaction cannot be forecasted. Or the amount is uniform."}
            end
        else
            {"#{transacts}": "Transaction cannot be forecasted. Or the amount is uniform."}
        end
    end

    def setup_user
        Category.create(name:"Income", user_id: self.id, transaction_type_id: 1)
        Category.create(name:"Refunds", user_id: self.id, transaction_type_id: 1)
        Category.create(name:"Gifts", user_id: self.id, transaction_type_id: 1)
        Category.create(name:"Miscellaneous", user_id: self.id, transaction_type_id: 1)


        bills = Category.create(name:"Bills", user_id: self.id, transaction_type_id: 2)
        shop = Category.create(name:"Groceries", user_id: self.id, transaction_type_id: 2)
        ent = Category.create(name:"Entertainment", user_id: self.id, transaction_type_id: 2)
        din = Category.create(name:"Dining Out", user_id: self.id, transaction_type_id: 2)
        transp = Category.create(name:"Transportation", user_id: self.id, transaction_type_id: 2)
        misc = Category.create(name:"Miscellaneous", user_id: self.id, transaction_type_id: 2)

        Budget.create(name: bills.name, amount: 0, category_id: bills.id, user_id: self.id)
        Budget.create(name: shop.name, amount: 0, category_id: shop.id, user_id: self.id)
        Budget.create(name: ent.name, amount: 0, category_id: ent.id, user_id: self.id)
        Budget.create(name: din.name, amount: 0, category_id: din.id, user_id: self.id)
        Budget.create(name: transp.name, amount: 0, category_id: transp.id, user_id: self.id)
        Budget.create(name: misc.name, amount: 0, category_id: misc.id, user_id: self.id)
    end


end
