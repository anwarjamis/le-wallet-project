class AddMovementsToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :movements, :user, null: false, foreign_key: true
  end
end
