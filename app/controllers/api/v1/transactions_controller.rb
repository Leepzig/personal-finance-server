class Api::V1::TransactionsController < ApplicationController
    before_action :find_transaction, only: [:delete, :update]

    def create
        budget = Budget.find_by_id(params[:budget_id])
        transaction = budget.transactions.new(transaction_params)
        if transaction.save
            render json: transaction, status: :created
        else
            render json: { errors: transaction.errors.full_messages}, status: 422
        end
    end
#TODO fix the destroy
    def destroy
        @transaction.destroy
    end

    def update
        @transaction.update(transaction_params)
        render json: @transaction
    end

    private

        def find_transaction
            @transaction = Transaction.find_by_id(params[:id])
        end

        def transaction_params
            params.permit(:name, :budgeted, :actual, :transaction_type, :budget_id)
        end
end
