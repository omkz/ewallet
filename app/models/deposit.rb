class Deposit < Transaction
  def create
    ActiveRecord::Base.transaction do
      self.save!
      self.update_stock
    end
  end

  def update_stock
    user.update! balance: user.balance + amount.to_i
  end
end
