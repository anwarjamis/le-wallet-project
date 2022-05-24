require "json"
require "open-uri"
require "date"

class MovementsController < ApplicationController

  def index
    @banks = BankAccount.where(user_id: current_user.id)
    @movements = Movement.where(user_id: current_user.id).order(post_date: :desc)
    @categories = Category.all
    if params[:bank].present? && params[:bank] != 'Todos'
      bank = BankAccount.find_by(bank: params[:bank])
      @movements = Movement.where(bank_account_id: bank.id, user_id: current_user.id)
    end
    if params[:bank].present? && params[:bank] == 'Todos'
      @movements = Movement.where(user_id: current_user.id).order(post_date: :desc)
    end
    if params[:category].present? && params[:category] != 'Todas'
      category = Category.find_by(name: params[:category])
      @movements = Movement.where(category_id: category.id, user_id: current_user.id)
    end
    if params[:category].present? && params[:category] == 'Todas'
      @movements = Movement.where(user_id: current_user.id).order(post_date: :desc)
    end
    if params[:quantity].present? && params[:quantity] != 'Todos'
      @movements = @movements.limit(params[:quantity])
    end
    if params[:category].present? && params[:category] == 'Todas'
      @movements = Movement.where(user_id: current_user.id).order(post_date: :desc)
    end
    if params[:query].present?
      @movements = Movement.where(user_id: current_user.id).search_by_description(params[:query])
    end
  end

  def bank_movements
    @bank = BankAccount.find(params[:bank_account_id])
    @movements = Movement.where(bank_account_id: @bank.id, user_id: current_user.id)
    if params[:query].present?
      @movements = Movement.where(user_id: current_user.id).search_by_description(params[:query])
    end
    if params[:quantity].present? && params[:quantity] != 'Todos'
      @movements = @movements.limit(params[:quantity])
    end
  end
end
