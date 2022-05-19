class Movement < ApplicationRecord
  belongs_to :bank_account
  # belongs_to :category

  validates :fintoc_id, :amount, :description, :currency, presence: true
  validates :fintoc_id, uniqueness: true
end
