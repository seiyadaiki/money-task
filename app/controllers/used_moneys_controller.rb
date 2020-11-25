class UsedMoneysController < ApplicationController
  def index
    @used_moneys = UsedMoney.all.order(created_at: :desc)
  end

  def new
    @used_money = UsedMoney.new
  end

  def create
    @used_money = UsedMoney.new(used_money_params)
    if @used_money.valid?
      @used_money.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def used_money_params
    params.require(:used_money).permit(:date, :location, :what, :how_much, :way_id,).merge(user_id: current_user.id)
  end

end
