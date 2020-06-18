class Expense < ApplicationRecord
    belongs_to :category
    validates :concept, :date, presence: true
end
