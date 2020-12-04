class BudgetsController < ApplicationController
    before_action :find_budget, only: [:edit, :update, :destroy]
    def create
        budg = Budget.create(budget_params)
        render json: budg
    end

    def update
        @budget.update(budget_params)
        render json: @budget
    end

    def destroy
        @budget.destroy
    end

    private

    def find_budget
        @budget = Budget.find(params[:id])
    end

    def budget_params
        params.require(:budget).permit(:name, :amount, :category_id, :user_id)
    end
end
