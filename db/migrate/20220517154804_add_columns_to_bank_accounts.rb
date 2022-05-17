class AddColumnsToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :bank_accounts, :pk, :string
    add_column :bank_accounts, :sk, :string
  end
end
