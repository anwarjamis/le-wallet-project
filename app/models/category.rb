class Category < ApplicationRecord
  has_many :movements
  has_many :user_categories, dependent: :destroy

  validates :name, presence: true
end
