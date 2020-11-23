class UsedMoneysController < ApplicationController
  def index
  end

  def new
    @used_money = UsedMoney.new
  end

  def create
    @used_money = UsedMoney.create(used_money_params)
  end
  
  private

  def used_money_params
    params.require(:used_money).permit(:when, :where, :what, :how_much, :way_id,).merge(user_id: current_user.id)
  end

end
