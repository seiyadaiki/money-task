class UsedMoneysController < ApplicationController
  def index
  end

  def new
    @used_money = UsedMoney.new
  end

  def create
    @used_money = UsedMoney.new(used_money_params)
    if @used_money.valid
      @used_money.save
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  private

  def used_money_params
    params.require(:used_money).permit(:when, :where, :what, :how_much, :way_id,).merge(user_id: current_user.id)
  end

end
