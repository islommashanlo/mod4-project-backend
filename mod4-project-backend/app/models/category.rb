class Category < ApplicationRecord
    has_many :transactions
    has_many :budgets
end
