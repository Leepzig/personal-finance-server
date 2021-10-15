class BudgetsController < ApplicationController
    before_action :find_budget, only: [:show, :update, :destroy]

    def index
        render json: Budget.all, status: :ok
    end

    def show
        if @budget
            render json: @budget, status: :ok
        else
            render_not_found
        end
    end

    def create
        budget = Budget.new(budget_params)
        if budget.save
            render json: budget, status: :created
        else
            render json: {errors: budget.errors.full_messages}
        end
    end

    def update
        @budget.update(budget_params)
        render json: @budget, status: :ok
    end

    def destroy
        # binding.pry
        @budget.destroy
        header :not_content
    end

    private
        def find_budget
            @budget = Budget.find_by_id(params[:id])
        end

        def render_not_found
            render json: { error: "Budget not found"}, status: :not_found
        end

        def budget_params
            params.permit(:header, :user_id)
        end
end
