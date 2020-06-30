class ExpensesController < ApplicationController
  
  def index
    
    @tab = :expenses
    @categories = Category.all
    @expense = Expense.new
    @expenses = Expense.all.order(date: :desc)
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
    if params[:type_transaction].present?
      @expenses = @expenses.where("type_transaction = ?", params[:type_transaction])
    end
    if params[:month].present?
      @expenses = @expenses.where("extract(month from date) = ? AND extract(year from date) = ?", params[:month], params[:year]).order(date: :asc)
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
end
