class Transactions::DepositsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(deposit_params) do |d|
      d.user = current_user  
    end

    if @deposit.create
      flash[:notice] = 'deposit was successfully processed.'
      redirect_to transactions_deposit_path(@deposit)
    else
      flash.now[:alert] = @deposit.errors.empty? ? 'deposit Error' : @deposit.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount)
  end
end
