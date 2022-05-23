class Movement < ApplicationRecord
  belongs_to :bank_account
  belongs_to :user
  # belongs_to :category

  include PgSearch::Model
  pg_search_scope :search_by_description,
    against: [ :description ],
    using: {
      tsearch: { prefix: true }
    }

  validates :fintoc_id, :amount, :description, :currency, presence: true
  validates :fintoc_id, uniqueness: true
end
