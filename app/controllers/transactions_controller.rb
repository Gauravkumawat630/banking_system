class TransactionsController < ApplicationController
  def create
    @account = Account.find(params[:account_id])
    amount = params[:amount].to_d
    transaction_type = params[:transaction_type]

    if transaction_type == 'add'
      @account.update(balance: @account.balance + amount)
      @account.transactions.create(amount: amount, transaction_type: 'add')
    elsif transaction_type == 'withdraw'
      if @account.balance >= amount
        @account.update(balance: @account.balance - amount)
        @account.transactions.create(amount: amount, transaction_type: 'withdraw')
      else
        flash[:alert] = 'Insufficient balance for withdrawal.'
      end
    else
      flash[:alert] = 'Invalid transaction type.'
    end

    redirect_to account_path(@account)
  end
end
