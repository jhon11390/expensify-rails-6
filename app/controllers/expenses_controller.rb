class ExpensesController < ApplicationController
  before_action :find_expense, only: [:edit, :update, :destroy]
  
  def index
    @tab = :expenses
    @categories = Category.all
    @expense = Expense.new
    if params[:category_id]
      @expenses = Expense.where(category_id: params[:category_id])
    elsif params[:type_transaction]
      @expenses = Expense.where(type_transaction: params[:type_transaction])
    else
      @expenses = Expense.all
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
      @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
        redirect_to :expenses, notice: "The #{@expense.type_transaction} #{@expense.concept} for $#{@expense.amount} on #{@expense.date.strftime("%b")} #{@expense.date.strftime("%d")} was created successfully!"
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end 

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
        redirect_to :expenses, notice: "The expense was updated successfully!"
    else
        redirect_to :expenses, alert: "The expense could not be update"
    end
  end

  def destroy
      expense = Expense.find(params[:id])
      expense.destroy

      redirect_to :expenses, notice: "The #{expense.type_transaction} #{expense.concept} for $#{expense.amount} on #{expense.date.strftime("%b")} #{expense.date.strftime("%d")} was destroyed successfully!"
  end

  private
      def expense_params
          params.require(:expense).permit(:type_transaction, :concept, :date, :amount, :category_id)
      end

      def find_expense
        @expense = Expense.find(params[:id])
      end

end
