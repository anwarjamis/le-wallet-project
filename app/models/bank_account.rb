class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :movements

  validates :pk, :sk, :link, presence: true
  validates :name, uniqueness: true
end
