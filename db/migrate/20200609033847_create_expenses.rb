class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :type
      t.text :concept
      t.date :date
      t.decimal :amount
      t.string :category_id

      t.timestamps
    end
  end
end
