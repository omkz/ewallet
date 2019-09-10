class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
