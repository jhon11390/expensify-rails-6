class Expense < ApplicationRecord
    belongs_to :category
    validates :concept, :date, presence: true
    enum type_date: [:Purchase, :Withdrawal, :Transfer, :Payment]
end
