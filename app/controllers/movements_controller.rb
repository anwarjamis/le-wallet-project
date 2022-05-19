require "json"
require "open-uri"

class MovementsController < ApplicationController

  def index
    @banks = BankAccount.where(user_id: current_user.id)
    @movements = @banks.map do |bank|
    url = "https://api.fintoc.com/v1/accounts/#{bank.fintoc_id}/movements?link_token=#{bank.link}"
    user_serialized = URI.open(url, "Authorization" => bank.sk).read
    JSON.parse(user_serialized)
    end
  end

  def bank_movements
    @bank = BankAccount.find(params[:bank_account_id])
    url = "https://api.fintoc.com/v1/accounts/#{@bank.fintoc_id}/movements?link_token=#{@bank.link}"
    user_serialized = URI.open(url, "Authorization" => @bank.sk).read
    @movements = JSON.parse(user_serialized)
  end

  def saving
    @bank = BankAccount.find(params[:bank_account_id])
    url = "https://api.fintoc.com/v1/accounts/#{@bank.fintoc_id}/movements?link_token=#{@bank.link}"
    user_serialized = URI.open(url, "Authorization" => @bank.sk).read
    @movements = JSON.parse(user_serialized)
    @movements.each do |movement|
      @movement = Movement.new(category_id: 1, bank_account_id: @bank.id, fintoc_id: movement['id'], amount: movement['amount'],
                               description: movement['description'], currency: movement['currency'])
      @movement.save
    end
    redirect_to bank_account_movements_path(@bank)
  end
end
