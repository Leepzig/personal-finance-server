class Api::V1::BudgetsController < ApplicationController
    before_action :find_budget, only: [:show, :update, :destroy]
    skip_before_action :authorized

    def index
        if params[:user_id]
            budgets = Budget.all.where('user_id = ?', params[:user_id])
            render json: budgets, status: :ok
        else
            render json: {errors: "no user id given"}
        end
    end

    def show
        if @budget
            render json: @budget, status: :ok
        else
            render_not_found
        end
    end

    def create
        @user = User.find_by_id(params[:user_id])
        budget = @user.budgets.new(budget_params)
        # binding.pry
        if budget.save
            render json: budget, status: :created
        else
            render json: {errors: budget.errors.full_messages}
        end
    end

    def update
        if @budget
            @budget.update(budget_params)
            render json: @budget, status: :ok
        else
            render_not_found
        end
    end

    def destroy
        if @budget
            @budget.destroy
            header :not_content
        else
            render_not_found
        end
    end

    private
        def find_budget
            @budget = Budget.find_by_id(params[:user_id])
        end

        def render_not_found
            render json: { error: "Budget not found"}, status: :not_found
        end

        def budget_params
            params.permit(:header, :user_id)
        end
end
