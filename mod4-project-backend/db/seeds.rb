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
income = Category.create(name:"Income", user_id: isa.id)
refund = Category.create(name:"Refunds", user_id: isa.id)
gift = Category.create(name:"Gifts", user_id: isa.id)
misc_inc = Category.create(name:"Miscellaneous", user_id: isa.id)
# Debit Type Category
bills = Category.create(name:"Bills", user_id: isa.id)
shop = Category.create(name:"Groceries", user_id: isa.id)
ent = Category.create(name:"Entertainment", user_id: isa.id)
din = Category.create(name:"Dining Out", user_id: isa.id)
transp = Category.create(name:"Transportation", user_id: isa.id)
misc = Category.create(name:"Miscellaneous", user_id: isa.id)

# User
isa_acc = Account.create(user_id: isa.id)
isa_bank = Bank.create(name: "Chase", account_id: isa_acc.id)

# Transactions
transact1 = Transaction.create(name: "Car Payment", amount: 500.00, t_date: Time.now.to_date, category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact2 = Transaction.create(name: "Rent", amount: 1500.00, t_date: Time.now.to_date, category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact3 = Transaction.create(name: "Shopping", amount: 100.00, t_date: Time.now.to_date, category_id: shop.id, transaction_type_id: debit.id, user_id: isa.id)
transact4 = Transaction.create(name: "Movies", amount: 100.00, t_date: Time.now.to_date, category_id: ent.id, transaction_type_id: debit.id, user_id: isa.id)
transact5 = Transaction.create(name: "Restaurant", amount: 100.00, t_date: Time.now.to_date, category_id: din.id, transaction_type_id: debit.id, user_id: isa.id)
transact6 = Transaction.create(name: "Train", amount: 100.00, t_date: Time.now.to_date, category_id: transp.id, transaction_type_id: debit.id, user_id: isa.id)
transact7 = Transaction.create(name: "Gift", amount: 100.00, t_date: Time.now.to_date, category_id: misc.id, transaction_type_id: debit.id, user_id: isa.id)

transact8 = Transaction.create(name: "Salary", amount: 100000.00, t_date: Time.now.to_date, category_id: income.id, transaction_type_id: credit.id, user_id: isa.id)
transact9 = Transaction.create(name: "Refund", amount: 0.50, t_date: Time.now.to_date, category_id: refund.id, transaction_type_id: credit.id, user_id: isa.id)
transact10 = Transaction.create(name: "Present", amount: 1.00, t_date: Time.now.to_date, category_id: gift.id, transaction_type_id: credit.id, user_id: isa.id)
transact11 = Transaction.create(name: "Portfolio", amount: 6.66, t_date: Time.now.to_date, category_id: misc_inc.id, transaction_type_id: credit.id, user_id: isa.id)

transact12 = Transaction.create(name: "Car Payment", amount: 658.00, t_date: Time.now.to_date+30, category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact13 = Transaction.create(name: "Car Payment", amount: 743.00, t_date: Time.now.to_date+60, category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)
transact14 = Transaction.create(name: "Car Payment", amount: 898.00, t_date: Time.now.to_date+90, category_id: bills.id, transaction_type_id: debit.id, user_id: isa.id)

# Budget
Budget.create(name: transact1.name, amount: transact1.amount, category_id: transact1.category_id, user_id: isa.id)
Budget.create(name: transact2.name, amount: transact2.amount, category_id: transact2.category_id, user_id: isa.id)
Budget.create(name: transact3.name, amount: transact3.amount, category_id: transact3.category_id, user_id: isa.id)
Budget.create(name: transact4.name, amount: transact4.amount, category_id: transact4.category_id, user_id: isa.id)
Budget.create(name: transact5.name, amount: transact5.amount, category_id: transact5.category_id, user_id: isa.id)
Budget.create(name: transact6.name, amount: transact6.amount, category_id: transact6.category_id, user_id: isa.id)
Budget.create(name: transact7.name, amount: transact7.amount, category_id: transact7.category_id, user_id: isa.id)






# def api_call(url)
#     uri = URI(url)
#     response = Net::HTTP.get_response(uri)
#     json_response = JSON.parse(response.read_body)    
    
# end




# byebug


# api_call("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.6162787,-73.9987585&radius=500&keyword=atm&key=#{ENV["API_KEY"]}")

# # api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")
# api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")