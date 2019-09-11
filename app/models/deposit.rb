class Deposit < Transaction
  def create
    ActiveRecord::Base.transaction do
      self.save!
      self.update_balance
    rescue ActiveRecord::RecordInvalid => e
      raise ActiveRecord::Rollback
    end
  end

  def update_balance
    user.update! balance: user.balance + amount.to_i
  end
end
