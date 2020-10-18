class TransactionsController < ApplicationController
    before_action :find_transaction, only: [:new, :create, :show, :update, :edit, :delete]

    def index
        transacts = Transaction.all
        render json: transacts
    end

    def create
        transact = Transaction.create(transact_params)
        render json: transact
    end

    def update
        @transaction.update(transact_params)
        render json: @transaction
    end

    private

    def find_transaction
        @transaction = Transaction.find(params[:id])
    end

    def transact_params
        params.require(:transaction).permit(:name, :amount.to_f, :t_date, :user_id.to_i, :category_id.to_i, :transaction_type_id.to_i)
    end
end
