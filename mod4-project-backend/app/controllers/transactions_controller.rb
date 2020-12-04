class TransactionsController < ApplicationController
    before_action :find_transaction, only: [:show, :update, :edit, :destroy]

    def index
        transact = Transaction.all 
        render json: transact
    end 

    def create
        transact = Transaction.create(transact_params)
        render json: transact
    end

    def update
        @transaction.update(transact_params)
        render json: @transaction
    end

    def destroy
        @transaction.destroy
        render json: @transaction
    end

    private

    def find_transaction
        @transaction = Transaction.find(params[:id])
    end

    def transact_params
        params.require(:transaction).permit(:name, :amount, :t_date, :user_id, :category_id, :transaction_type_id)
    end
end
