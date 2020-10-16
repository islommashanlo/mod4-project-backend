class Account < ApplicationRecord
    has_many :banks
    belongs_to :user
end
