class UsedMoneysController < ApplicationController
  #before_action :this_month_total, only: :index

  def index
    @used_moneys = UsedMoney.all.order(date: :desc)
    @this_month = Date.today.all_month
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
  
  #def this_month_total
    #@used_moneys = UsedMoney.all
    #@this_month = Date.today.all_month
    #if (@this_month.include?(Date.parse(@used_moneys[:date].to_s)))
      #@used_moneys.how_much.sum
    #end
  #end
end
