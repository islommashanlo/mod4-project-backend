class CategoriesController < ApplicationController
    before_action :find_category

    def create
        found_user = User.find(params[:user_id])
        if found_user.transactions.map{|e|e.category}.any?{|e|e.name.downcase === category_params[:name].downcase} == false
            new_cat = Category.create(category_params)
            render json: new_cat
        else
            found_cat = Category.find_by(name: category_params[:name])
            render json: found_cat
        end
    end

    private

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
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