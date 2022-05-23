require 'open-uri'
require 'json'

class BankAccountsController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]

  def index
    @banks = BankAccount.where(user_id: current_user.id)
    @movements = Movement.where(user_id: current_user.id).limit(10).order(post_date: :desc)
    @balance = @banks.map do |bank|
      url = "https://api.fintoc.com/v1/accounts/#{bank.fintoc_id}?link_token=#{bank.link}"
      user_serialized = URI.open(url, "Authorization" => bank.sk).read
      user = JSON.parse(user_serialized)
      user['balance']['available']
    end
    @banks.each do |bank|
      url = "https://api.fintoc.com/v1/accounts/#{bank.fintoc_id}/movements?link_token=#{bank.link}"
      user_serialized = URI.open(url, "Authorization" => bank.sk).read
      movements = JSON.parse(user_serialized)
      movements.each do |movement|
        movement = Movement.new(user_id: current_user.id, category_id: 1, bank_account_id: bank.id, fintoc_id: movement['id'], amount: movement['amount'],
                                 description: movement['description'], currency: movement['currency'], post_date: movement['post_date'])
        movement.save
      end
    end
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
    @bank.fintoc_id = user.first['id']
    if @bank.save
      # url = "https://api.fintoc.com/v1/accounts/#{@bank.fintoc_id}/movements?link_token=#{@bank.link}"
      # user_serialized = URI.open(url, "Authorization" => @bank.sk).read
      # movements = JSON.parse(user_serialized)
      # movements.each do |movement|
      #   movement = Movement.new(user_id: current_user.id, category_id: 1, bank_account_id: @bank.id, fintoc_id: movement['id'], amount: movement['amount'],
      #                            description: movement['description'], currency: movement['currency'], post_date: movement['post_date'])
      #   movement.save
      # end
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
    if @bank.update(bank_params)
      redirect_to bank_accounts_path
    else
      render 'edit'
    end
  end

  def destroy
    @bank.destroy
    redirect_to bank_accounts_path
  end

  private

  def bank_params
    params.require(:bank_account).permit(:name, :sk, :pk, :link, :bank)
  end

  def set_bank
    @bank = BankAccount.find(params[:id])
  end
end
