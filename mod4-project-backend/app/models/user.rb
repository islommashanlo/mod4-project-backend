class User < ApplicationRecord
# -----------------------------------------------------------------------------------
    has_many :transactions
    has_many :accounts
    has_many :banks, through: :accounts, dependent: :destroy
# -----------------------------------------------------------------------------------
    validates :username, uniqueness: { case_sensitive: false }, length: {maximum: 50}
# -----------------------------------------------------------------------------------
end
