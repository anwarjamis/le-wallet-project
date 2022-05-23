class Category < ApplicationRecord
  has_many :movements
  has_many :user_categories

  validates :name, presence: true
end
