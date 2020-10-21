# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

isa = User.create(username: "isa", first_name: "Isa", last_name: "Akhmedov", address: "7205 17th Avenue, Brooklyn, NY", password: "test", password_confirmation: "test")

# Transaction Type
credit = TransactionType.create(name: "Credit")
debit = TransactionType.create(name: "Debit")
# Credit Type Categories 
income = Category.create(name:"Income", user_id: isa.id, transaction_type_id: credit.id)
refund = Category.create(name:"Refunds", user_id: isa.id, transaction_type_id: credit.id)
gift = Category.create(name:"Gifts", user_id: isa.id, transaction_type_id: credit.id)
misc_inc = Category.create(name:"Miscellaneous", user_id: isa.id, transaction_type_id: credit.id)
# Debit Type Category
bills = Category.create(name:"Bills", user_id: isa.id, transaction_type_id: debit.id)
shop = Category.create(name:"Groceries", user_id: isa.id, transaction_type_id: debit.id)
ent = Category.create(name:"Entertainment", user_id: isa.id, transaction_type_id: debit.id)
din = Category.create(name:"Dining Out", user_id: isa.id, transaction_type_id: debit.id)
transp = Category.create(name:"Transportation", user_id: isa.id, transaction_type_id: debit.id)
misc = Category.create(name:"Miscellaneous", user_id: isa.id, transaction_type_id: debit.id)

# User
isa_bank = Bank.create(name: "Chase")
isa_acc = Account.create(user_id: isa.id, bank_id: isa_bank.id)

# Transactions
 #Month 1
transact1 = Transaction.create(name: "Bills", amount: 500.00, t_date: "2020-01-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact2 = Transaction.create(name: "Rent", amount: 1500.00, t_date: "2020-01-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact3 = Transaction.create(name: "Shopping", amount: 100.00, t_date: "2020-01-01", category_id: shop.id, transaction_type_id: debit.id, user_id: isa.id)
transact4 = Transaction.create(name: "Movies", amount: 100.00, t_date: "2020-01-01", category_id: ent.id, transaction_type_id: debit.id, user_id: isa.id)
transact5 = Transaction.create(name: "Restaurant", amount: 100.00, t_date: "2020-01-01", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
transact6 = Transaction.create(name: "Train", amount: 100.00, t_date: "2020-01-01", category_id: transp.id, transaction_type_id: debit.id, user_id: isa.id)
transact7 = Transaction.create(name: "Gift", amount: 100.00, t_date: "2020-01-01", category_id: misc.id, transaction_type_id: debit.id, user_id: isa.id)

transact8 = Transaction.create(name: "Salary", amount: 10000.00, t_date: "2020-01-01", category_id: income.id, transaction_type_id: credit.id, user_id: isa.id)
transact9 = Transaction.create(name: "Refund", amount: 0.50, t_date: "2020-01-01", category_id: refund.id, transaction_type_id: credit.id, user_id: isa.id)
transact10 = Transaction.create(name: "Present", amount: 1.00, t_date: "2020-01-01", category_id: gift.id, transaction_type_id: credit.id, user_id: isa.id)
transact11 = Transaction.create(name: "Portfolio", amount: 6.66, t_date: "2020-01-01", category_id: misc_inc.id, transaction_type_id: credit.id, user_id: isa.id)
#Month 2
Transaction.create(name: "Bills", amount: 500.00, t_date: "2020-02-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Rent", amount: 1500.00, t_date: "2020-02-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Shopping", amount: 100.00, t_date: "2020-02-01", category_id: shop.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Movies", amount: 100.00, t_date: "2020-02-01", category_id: ent.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 100.00, t_date: "2020-02-01", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Train", amount: 100.00, t_date: "2020-02-01", category_id: transp.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Gift", amount: 100.00, t_date: "2020-02-01", category_id: misc.id, transaction_type_id: debit.id, user_id: isa.id)

Transaction.create(name: "Salary", amount: 10000.00, t_date: "2020-02-01", category_id: income.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Refund", amount: 0.50, t_date: "2020-02-01", category_id: refund.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Present", amount: 1.00, t_date: "2020-02-01", category_id: gift.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Portfolio", amount: 6.66, t_date: "2020-02-01", category_id: misc_inc.id, transaction_type_id: credit.id, user_id: isa.id)
#Month 3
Transaction.create(name: "Bills", amount: 500.00, t_date: "2020-03-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Rent", amount: 1500.00, t_date: "2020-03-01", category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Shopping", amount: 100.00, t_date: "2020-03-01", category_id: shop.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Movies", amount: 100.00, t_date: "2020-03-01", category_id: ent.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 100.00, t_date: "2020-03-01", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Train", amount: 100.00, t_date: "2020-03-01", category_id: transp.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Gift", amount: 100.00, t_date: "2020-03-01", category_id: misc.id, transaction_type_id: debit.id, user_id: isa.id)

Transaction.create(name: "Salary", amount: 10000.00, t_date: "2020-03-01", category_id: income.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Refund", amount: 0.50, t_date: "2020-03-01", category_id: refund.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Present", amount: 1.00, t_date: "2020-03-01", category_id: gift.id, transaction_type_id: credit.id, user_id: isa.id)
Transaction.create(name: "Portfolio", amount: 6.66, t_date: "2020-03-01", category_id: misc_inc.id, transaction_type_id: credit.id, user_id: isa.id)


Transaction.create(name: "Restaurant", amount: 100.00, t_date: "2020-03-12", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 110.00, t_date: "2020-03-13", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 134.00, t_date: "2020-03-14", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 222.00, t_date: "2020-03-15", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 99.00, t_date: "2020-03-16", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 188.00, t_date: "2020-03-17", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
Transaction.create(name: "Restaurant", amount: 250.00, t_date: "2020-03-18", category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)

# Budget
Budget.create(name: bills.name, amount: 2000, category_id: bills.id, user_id: isa.id)
Budget.create(name: shop.name, amount: 200, category_id: shop.id, user_id: isa.id)
Budget.create(name: ent.name, amount: 200, category_id: ent.id, user_id: isa.id)
Budget.create(name: din.name, amount: 100, category_id: din.id, user_id: isa.id)
Budget.create(name: transp.name, amount: 100, category_id: transp.id, user_id: isa.id)
Budget.create(name: misc.name, amount: 100, category_id: misc.id, user_id: isa.id)






# def api_call(url)
#     uri = URI(url)
#     response = Net::HTTP.get_response(uri)
#     json_response = JSON.parse(response.read_body)    
    
# end




# byebug


# api_call("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.6162787,-73.9987585&radius=500&keyword=atm&key=#{ENV["API_KEY"]}")

# # api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")
# api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")