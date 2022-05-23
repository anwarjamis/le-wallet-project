class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :movements, dependent: :destroy

  validates :pk, :sk, :link, :bank, presence: true
  validates :name, uniqueness: true
end
