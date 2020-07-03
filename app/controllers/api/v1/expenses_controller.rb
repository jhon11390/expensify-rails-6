class Api::V1::ExpensesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
      expenses = Expense.all
      if params[:category_id].present?
        expenses =  expenses.where("category_id = ?", params[:category_id])
      end
      if params[:type_transaction].present?
        expenses = expenses.where("type_transaction = ?", params[:type_transaction])
      end
      if params[:month].present?
        expenses =  expenses.where("extract(month from date) = ? AND extract(year from date) = ?", params[:month], params[:year]).order(date: :asc)
      end
      render json: expenses
    end

    def create
        @expense = Expense.new(expense_params)
    
        if @expense.save
          render json: @expense, status: :created
        else
          render json: { errors: @expense.errors }, status: :unprocessable_entity
        end
    end

    def update
        @expense = Expense.find(params[:id])
        if @expense.update(expense_params)
          render json: @expense, status: :ok
        else
          render json: { errors: @expense.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        
        head :no_content
    end

    private
        def expense_params
            params.require(:expense).permit(:type_transaction, :concept, :date, :amount, :category_id)
        end
end