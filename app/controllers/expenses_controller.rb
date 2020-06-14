class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @categories = Category.all
    @expense = Expense.new
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
          redirect_to :expenses, notice: "El gasto fue publicado con éxito"
      else
          render :new
      end
  end

  def edit
      @expense = Expense.find(params[:id])
  end 

  def update
      @expense = Expense.find(params[:id])
      if @expense.update(expense_params)
          redirect_to :expenses
      else
          render :edit
      end
  end

  def destroy
      expense = Expense.find(params[:id])
      expense.destroy

      redirect_to :expenses
  end

  private
      def expense_params
          params.require(:expense).permit(:type, :concept, :date, :amount)
      end

end
