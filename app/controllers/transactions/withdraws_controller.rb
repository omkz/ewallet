class Transactions::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def new
    @withdraw = Withdraw.new
  end

  def create
    @withdraw = Withdraw.new(withdraw_params) do |t|
      t.user = current_user  
    end

    if @withdraw.create
      flash[:notice] = 'Withdrawal was successfully processed.'
      redirect_to transactions_withdraw_path(@withdraw)
    else
      flash.now[:alert] = @withdraw.errors.empty? ? 'Withdraw Error' : @withdraw.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def withdraw_params
    params.require(:withdraw).permit(:amount)
  end
end
