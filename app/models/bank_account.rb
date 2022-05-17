class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :movements

  validates :bank, :pk, :sk, :link, presence: true
  validates :name, uniqueness: true
end
