class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :bank
      t.bigint :account_number
      t.string :account_type
      t.string :name
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
