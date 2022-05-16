class CreateMovements < ActiveRecord::Migration[6.1]
  def change
    create_table :movements do |t|
      t.string :fintoc_id
      t.integer :amount
      t.string :description
      t.date :date
      t.string :comment
      t.string :currency
      t.references :bank_account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
