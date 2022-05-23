class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bank_accounts
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :movements
  has_one_attached :photo

  validates :name, :rut, presence: true
  validates :rut, uniqueness: true
end
