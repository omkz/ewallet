class Transfer < Transaction
  validates :from_id, presence: true, numericality: true
  validates :to_id, presence: true, numericality: true
  validate :validate_sender_receiver

  def create
    ActiveRecord::Base.transaction do
      self.save!
      self.update_balance_sender
      self.update_balance_receiver
    rescue StandardError => e
      errors.add(:base, e.message) if self.errors.empty?
      raise ActiveRecord::Rollback
    end
  end

  def update_balance_sender
    @user = self.from
    @user.update! balance: @user.balance - amount.to_i
  end

  def update_balance_receiver
    @user = User.find to_id
    @user.update! balance: @user.balance + amount.to_i
  end

  def validate_sender_receiver
    if self.from.id == self.to_id
       errors.add(:from_id, "Cannot transfer to self")
    end 
  end
end
