class AddColumnToBankAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :bank_accounts, :fintoc_id, :string
  end
end
