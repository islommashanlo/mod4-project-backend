# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roy = User.create(username: "royFloresNyc", first_name: "Roy", last_name: "Flores", address: "3612, Broadway, NY", password: "test", password_confirmation: "test")

# Transaction Type
credit = TransactionType.create(name: "Credit")
debit = TransactionType.create(name: "Debit")
# Credit Type Categories 
income = Category.create(name:"Income", user_id: roy.id, transaction_type_id: credit.id)
refund = Category.create(name:"Refunds", user_id: roy.id, transaction_type_id: credit.id)
gift = Category.create(name:"Gifts", user_id: roy.id, transaction_type_id: credit.id)
misc_inc = Category.create(name:"Miscellaneous", user_id: roy.id, transaction_type_id: credit.id)
# Debit Type Category
bills = Category.create(name:"Bills", user_id: roy.id, transaction_type_id: debit.id)
shop = Category.create(name:"Groceries", user_id: roy.id, transaction_type_id: debit.id)
ent = Category.create(name:"Entertainment", user_id: roy.id, transaction_type_id: debit.id)
din = Category.create(name:"Dining Out", user_id: roy.id, transaction_type_id: debit.id)
transp = Category.create(name:"Transportation", user_id: roy.id, transaction_type_id: debit.id)
misc = Category.create(name:"Miscellaneous", user_id: roy.id, transaction_type_id: debit.id)

# User
roy_bank = Bank.create(name: "Chase")
roy_acc = Account.create(user_id: roy.id, bank_id: roy_bank.id)

# Date generator
def getRandomPrevDate(numOfMonthAgo)
    date = DateTime.now - (((numOfMonthAgo - 1) * 30) + (rand * 30))
    return date.strftime('%Y-%m-%d')
end 

# Transactions
 #3 Months Ago
Transaction.create(name: "Salary", amount: 5000.00, t_date: "#{(DateTime.now - 60).year}-#{(DateTime.now - 90).strftime('%m')}-01", category_id: income.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Rite Aid", amount: 1.50, t_date: getRandomPrevDate(3), category_id: refund.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Check from Nana", amount: 100.00, t_date: getRandomPrevDate(3), category_id: gift.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Acct Dividend", amount: 6.66, t_date: getRandomPrevDate(3), category_id: misc_inc.id, transaction_type_id: credit.id, user_id: roy.id)

Transaction.create(name: "Rent", amount: 1500.00, t_date: "#{(DateTime.now - 60).year}-#{(DateTime.now - 90).strftime('%m')}-01", category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Student Loan", amount: 500.00, t_date: getRandomPrevDate(3), category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "WholeFoods", amount: 98.00, t_date: getRandomPrevDate(3), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Concert", amount: 100.00, t_date: getRandomPrevDate(3), category_id: ent.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "The Smith", amount: 87.98, t_date: getRandomPrevDate(3), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "MTA Card", amount: 100.00, t_date: getRandomPrevDate(3), category_id: transp.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Gift for Jordan", amount: 100.00, t_date: getRandomPrevDate(3), category_id: misc.id, transaction_type_id: debit.id, user_id: roy.id)

#2 Months Ago
Transaction.create(name: "Salary", amount: 5000.00, t_date: "#{(DateTime.now - 30).year}-#{(DateTime.now - 60).strftime('%m')}-01", category_id: income.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Duane Reade", amount: 0.50, t_date: getRandomPrevDate(2), category_id: refund.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Check from Mom", amount: 20.00, t_date: getRandomPrevDate(2), category_id: gift.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Acct Dividend", amount: 6.66, t_date: getRandomPrevDate(2), category_id: misc_inc.id, transaction_type_id: credit.id, user_id: roy.id)

Transaction.create(name: "Rent", amount: 1500.00, t_date: "#{(DateTime.now - 30).year}-#{(DateTime.now - 60).strftime('%m')}-01", category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Student Loan", amount: 500.00, t_date: getRandomPrevDate(2), category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "WholeFoods", amount: 100.00, t_date: getRandomPrevDate(2), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Movies", amount: 80.00, t_date: getRandomPrevDate(2), category_id: ent.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "River Thai", amount: 30.00, t_date: getRandomPrevDate(2), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "MTA Card", amount: 100.00, t_date: getRandomPrevDate(2), category_id: transp.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Gift", amount: 100.00, t_date: getRandomPrevDate(2), category_id: misc.id, transaction_type_id: debit.id, user_id: roy.id)

#Within the last Month
Transaction.create(name: "Salary", amount: 5000.00, t_date: "#{DateTime.now.year}-#{DateTime.now.strftime('%m')}-01", category_id: income.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Amazon", amount: 5.00, t_date: getRandomPrevDate(1), category_id: refund.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Venmo from David", amount: 50.00, t_date: getRandomPrevDate(1), category_id: gift.id, transaction_type_id: credit.id, user_id: roy.id)
Transaction.create(name: "Acct Dividend", amount: 6.66, t_date: getRandomPrevDate(1), category_id: misc_inc.id, transaction_type_id: credit.id, user_id: roy.id)

Transaction.create(name: "Rent", amount: 1500.00, t_date: "#{DateTime.now.year}-#{DateTime.now.strftime('%m')}-01", category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Student Loan", amount: 500.00, t_date: getRandomPrevDate(1), category_id: bills.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "WholeFoods", amount: 70.00, t_date: getRandomPrevDate(1), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Mulan on iTunes", amount: 25.00, t_date: getRandomPrevDate(1), category_id: ent.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "The Smith", amount: 98.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "MTA Card", amount: 100.00, t_date: getRandomPrevDate(1), category_id: transp.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Venmo to David", amount: 100.00, t_date: getRandomPrevDate(1), category_id: misc.id, transaction_type_id: debit.id, user_id: roy.id)

Transaction.create(name: "The Smith", amount: 100.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "HandPulled Noodles", amount: 45.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "River Thai", amount: 31.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Jan Jad Vietnamese", amount: 55.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "The Empire", amount: 168.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Starbucks", amount: 15.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Mamasushi", amount: 150.00, t_date: getRandomPrevDate(1), category_id: din.id, transaction_type_id: debit.id, user_id: roy.id)

Transaction.create(name: "Amazon Fresh", amount: 100.00, t_date: getRandomPrevDate(1), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "WholeFoods", amount: 90.00, t_date: getRandomPrevDate(2), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Amazon Prime", amount: 80.00, t_date: getRandomPrevDate(1), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "WholeFoods", amount: 70.00, t_date: getRandomPrevDate(3), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)
Transaction.create(name: "Food Town", amount: 33.00, t_date: getRandomPrevDate(3), category_id: shop.id, transaction_type_id: debit.id, user_id: roy.id)



# Budget
Budget.create(name: bills.name, amount: 2000, category_id: bills.id, user_id: roy.id)
Budget.create(name: shop.name, amount: 200, category_id: shop.id, user_id: roy.id)
Budget.create(name: ent.name, amount: 200, category_id: ent.id, user_id: roy.id)
Budget.create(name: din.name, amount: 100, category_id: din.id, user_id: roy.id)
Budget.create(name: transp.name, amount: 100, category_id: transp.id, user_id: roy.id)
Budget.create(name: misc.name, amount: 100, category_id: misc.id, user_id: roy.id)

