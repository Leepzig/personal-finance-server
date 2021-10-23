class Api::V1::TransactionsController < ApplicationController
    before_action :find_transaction, only: [:delete, :update]

    def create
        budget = Budget.find_by_id(params[:budget_id])
        # binding.pry
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
        # set up some error catching here a conditional or something
        @transaction.update(transaction_params)
        # binding.pry
        render json: @transaction
    end

    private

        def find_transaction
            @transaction = Transaction.find_by_id(params[:id])
        end

        def transaction_params
            params.permit(:id, :name, :budgeted, :actual, :transaction_type, :budget_id)
        end
end
