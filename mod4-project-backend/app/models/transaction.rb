class Transaction < ApplicationRecord
    belongs_to :transaction_type
    belongs_to :category
    belongs_to :user
end
