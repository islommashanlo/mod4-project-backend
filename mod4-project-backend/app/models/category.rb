class Category < ApplicationRecord
# ------------------------------------------------------------------------------------------------
    has_many :transactions
    has_many :budgets
    belongs_to :transaction_type
    belongs_to :user
# ------------------------------------------------------------------------------------------------
    validates :name, presence: true, length: {maximum: 50}
# ------------------------------------------------------------------------------------------------    
end
