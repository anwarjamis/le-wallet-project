require "json"
require "open-uri"

class MovementsController < ApplicationController

  def index
    @bank = BankAccount.where(user_id: current_user.id).first
    url = "https://api.fintoc.com/v1/accounts/#{@bank.fintoc_id}/movements?link_token=#{@bank.link}"
    user_serialized = URI.open(url, "Authorization" => @bank.sk).read
    @movements = JSON.parse(user_serialized)
  end

end
