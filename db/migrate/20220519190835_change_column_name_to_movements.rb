class ChangeColumnNameToMovements < ActiveRecord::Migration[6.1]
  def change
    rename_column :movements, :date, :post_date
  end
end
