class Api::V1::ExpensesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
      render json: Expense.all
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