class DashboardsController < ApplicationController
  def index
    @tab = :dashboard
    @expenses = Expense.all.order(date: :desc)
    @categories = Category.all
    @today = Expense.where(date: Date.today).sum(:amount)
    @yesterday = Expense.where(date: 1.days.ago).sum(:amount)
    @this_month = Expense.where('extract(month from date) = ?', Date.today.month).sum(:amount)
    @last_month = Expense.where('extract(month from date) = ?', 1.month.ago.month).sum(:amount)
    @column_data = Expense.type_dates.keys.map do |type|
      { name: type, data: Expense.where(type_transaction: type).group_by_month(:date, last: 6, format: "%b-%y").sum(:amount)}
    end
    @per_day = Expense.where('extract(month from date) = ?', Date.today.month).order('extract(day from date)').group(:type_transaction).group('extract(day from date)').sum(:amount)
    @per_category = [["Restaurants", Expense.where(category_id: 1).sum(:amount)], ["Grocery", Expense.where(category_id: 2).sum(:amount)], ["Car", Expense.where(category_id: 3).sum(:amount)], ["Services", Expense.where(category_id: 4).sum(:amount)], ["Home", Expense.where(category_id: 5).sum(:amount)], ["Education", Expense.where(category_id: 6).sum(:amount)], ["Fun", Expense.where(category_id: 7).sum(:amount)], ["Travel", Expense.where(category_id: 8).sum(:amount)]]
    @name_this_month = Date::MONTHNAMES[Date.today.month], Date.today.year
    @name_last_month = Date::MONTHNAMES[1.month.ago.month], Date.today.year
    sum = 0
    sum2 = 0
    @list_this_month = Expense.where("date >= ?", DateTime.now.beginning_of_month)
    @acum_this_month = @list_this_month.where('extract(month from date) = ?', Date.today.month).order('extract(day from date)').group('extract(day from date)').sum(:amount).map { |x,y| { x => (sum += y)} }.reduce({}, :merge)
    @acum_last_month = Expense.where('extract(month from date) = ?', 1.month.ago.month).order('extract(day from date)').group('extract(day from date)').sum(:amount).map { |x,y| { x => (sum2 += y)} }.reduce({}, :merge)
  end
end
