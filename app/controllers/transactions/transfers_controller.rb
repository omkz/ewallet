class Transactions::TransfersController < ApplicationController
  before_action :authenticate_user!

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params) do |transfer|
      transfer.from = current_user  
      transfer.to_id = transfer_params[:to_id]
    end

    if @transfer.create
      flash[:notice] = 'transfer was successfully processed.'
      redirect_to transactions_transfer_path(@transfer)
    else
      flash.now[:alert] = @transfer.errors.empty? ? 'Transfer Error' : @transfer.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:amount, :to_id)
  end

end
