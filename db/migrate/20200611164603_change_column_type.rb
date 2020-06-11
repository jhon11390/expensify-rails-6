class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    rename_column :expenses, :type, :type_transaction
  end
end
