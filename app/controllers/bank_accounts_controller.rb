require "open-uri"
require 'json'

class BankAccountsController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    @bank_accounts = BankAccount.all
  end

  def new
    @bank = BankAccount.new
  end

  def create
    @bank = BankAccount.new(bank_params)
    @bank.user_id = current_user.id
    url = "https://api.fintoc.com/v1/accounts/?link_token=#{@bank.link}"
    user_serialized = URI.open(url, "Authorization" => @bank.sk).read
    user = JSON.parse(user_serialized)
    @bank.account_number = user.first['number']
    @bank.account_type = user.first['official_name']
    if @bank.save
      redirect_to root_path
    else
      render 'new'
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
    params.require(:bank_account).permit(:name, :sk, :pk, :link, :bank)
  end

  def set_bank
    @bank = BankAccount.find(params[:id])
  end
end
