class BankAccountsController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    @bank_accounts = BankAccount.all
  end

  def new
    @bank = BankAccount.new
  end

  def create
    @bank = BankAccount.new
    # Usar la API
    if @bank.save
      redirect_to bank_accounts_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @bank = BankAccount.new(bank_params)
    if @bank.update
      redirect_to bank_accounts_path
    else
      render 'edit'
    end
  end

  def destroy
    @bank.destroy
  end

  private

  def bank_params
    params.require(:ban).permit(:name)
  end

  def set_bank
    @bank = BankAccount.find(params[:id])
  end
end
