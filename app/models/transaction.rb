class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :from, :class_name => 'User', optional: true
  belongs_to :to, :class_name => 'User', optional: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
