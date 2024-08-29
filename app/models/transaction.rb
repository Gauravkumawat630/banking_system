class Transaction < ApplicationRecord
  belongs_to :account

  validates :amount, numericality: { greater_than: 0 }
  validates :transaction_type, inclusion: { in: %w[add withdraw] }
end
