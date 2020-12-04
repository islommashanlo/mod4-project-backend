class CategoriesController < ApplicationController
    before_action :find_category, only: [:destroy, :show, :update,]

    def create
            new_cat = Category.create(category_params)
            cat_budget = Budget.create(name: new_cat.name, amount: 0, category_id: new_cat.id, user_id: new_cat.user_id)
            render json: [new_cat, cat_budget]
    end

    private

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :user_id, :transaction_type_id)
    end

end



# Credit Category 

# Income
# Refunds
# Gifts
# Miscellaneous 


# Debit Type
# Bills
# Groceries
# Entertainment
# Dining Out
# Transportation
# Miscellaneous
# *Custom Category