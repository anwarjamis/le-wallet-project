class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home instructions]

  def home
    if user_signed_in?
      redirect_to bank_accounts_path
    end
  end

  def instructions
  end
end
