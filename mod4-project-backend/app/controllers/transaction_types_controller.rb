class TransactionTypesController < ApplicationController
    before_action :find_transaction_type, only: [:show] 

    def index
        t_types = TransactionType.all
        render json: t_types
    end



    def show
        @transaction_type
    end

    private

    def transact_type_params
        params.require(:transaction_type).permit(:name)
    end

    def find_transaction_type
        @transaction_type = TransactionType.find(params[:id])
    end

end
