class User < ApplicationRecord
  has_many :transactions
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0, message: ": Your balance is not enough" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
