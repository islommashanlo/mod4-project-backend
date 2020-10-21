class TransactionType < ApplicationRecord
    has_many :transactions
    has_many :categories
end
