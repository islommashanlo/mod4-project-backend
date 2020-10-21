class Transaction < ApplicationRecord
    belongs_to :transaction_type
    belongs_to :category
    belongs_to :user

    

    def regr_date
        str_arr = self.t_date.split("-")
        c_year = str_arr[0].to_i * 365
        c_month = str_arr[1].to_i * 30
        c_days = str_arr[2].to_i
        c_date = (c_year + c_month + c_days)
        c_date
    end

end
