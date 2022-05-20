require "json"
require "open-uri"
require "date"

class MovementsController < ApplicationController
  def index
    @banks = BankAccount.where(user_id: current_user.id)
    @banks.map do |bank|
      url = "https://api.fintoc.com/v1/accounts/#{bank.fintoc_id}/movements?link_token=#{bank.link}"
      user_serialized = URI.open(url, "Authorization" => bank.sk).read
      JSON.parse(user_serialized)
    end
    @movements = Movement.all.order(post_date: :desc)
  end

  def bank_movements
    @bank = BankAccount.find(params[:bank_account_id])
    url = "https://api.fintoc.com/v1/accounts/#{@bank.fintoc_id}/movements?link_token=#{@bank.link}"
    user_serialized = URI.open(url, "Authorization" => @bank.sk).read
    @movements = JSON.parse(user_serialized)
    @movements.each do |movement|
      @movement = Movement.new(category_id: 1, bank_account_id: @bank.id, fintoc_id: movement['id'], amount: movement['amount'],
                               description: movement['description'], currency: movement['currency'], post_date: movement['post_date'])
      @movement.save
    end
    if params[:query].present?
      @movements = Movement.search_by_description(params[:query])
    end
  end

  def update
    @movement = Movie.find()
    @movement.update(movement_params)

    respond_to do |format|
      format.html { redirect_to movies_path }
      format.text { render partial: "movements/movement_info", locals: { movement: @movement }, formats: [:html] }
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:name)
  end
end
