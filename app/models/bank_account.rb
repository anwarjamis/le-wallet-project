class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :movements

  validates :bank, :account_number, :account_type, :link, presence: true
  validates :name, uniqueness: true
end
