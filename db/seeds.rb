# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ name: 'Restaurants' }, { name: 'Grocery' }, { name: 'Car' }, { name: 'Services' }, { name: 'Home' }, { name: 'Education' }, { name: 'Fun' }, { name: 'Travel' }])

20.times do
    Expense.create(type_transaction: 'Purchase', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Food.spice, category_id: 1, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Transfer', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Food.spice, category_id: 1, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Withdrawal', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Food.ingredient, category_id: 2, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Purchase', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Food.ingredient, category_id: 2, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Transfer', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Vehicle.manufacture, category_id: 3, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Payment', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Company.bs, category_id: 4, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Purchase', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Company.bs, category_id: 4, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Purchase', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Commerce.product_name, category_id: 5, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Withdrawal', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Commerce.product_name, category_id: 5, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Withdrawal', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Educator.course_name, category_id: 6, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Payment', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Educator.course_name, category_id: 6, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Transfer', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Games::Pokemon.name, category_id: 7, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Withdrawal', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Games::Pokemon.name, category_id: 7, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Payment', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Movies::LordOfTheRings.location, category_id: 8, amount: Faker::Number.between(from: 100000, to: 2000000))
end

20.times do
    Expense.create(type_transaction: 'Purchase', date: Faker::Date.between(from: 12.months.ago, to: Date.today), concept: Faker::Movies::LordOfTheRings.location, category_id: 8, amount: Faker::Number.between(from: 100000, to: 2000000))
end
