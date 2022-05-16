class Category < ApplicationRecord
  has_many :movements

  validates :name, presence: true
  validates :name, uniqueness: true
end
