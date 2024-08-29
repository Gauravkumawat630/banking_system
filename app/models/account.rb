class Account < ApplicationRecord
    has_many :transactions, dependent: :destroy
  
    validates :user, presence: true
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
  end
  