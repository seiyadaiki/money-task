class UsedMoneysController < ApplicationController

  def index
    @used_moneys = UsedMoney.all.order(date: :desc)
    @this_month = Date.today.all_month
    @total = []
    UsedMoney.all.each do |used_money|
      if (@this_month.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total << used_money.how_much
       end
      end
    end
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

  def show
    @used_moneys = UsedMoney.all.order(date: :desc)
    @this_month = Date.today.all_month
    @last_month = Date.today.months_ago(1).all_month
    @two_month_ago = Date.today.months_ago(2).all_month
    @three_month_ago = Date.today.months_ago(3).all_month
    @four_month_ago = Date.today.months_ago(4).all_month
    @five_month_ago = Date.today.months_ago(5).all_month
    @six_month_ago = Date.today.months_ago(6).all_month
    @total = []
    UsedMoney.all.each do |used_money|
      if (@this_month.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total << used_money.how_much
       end
      end
    end
    @total_last_month = []
    UsedMoney.all.each do |used_money|
      if (@last_month.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_last_month << used_money.how_much
       end
      end
    end
    @total_two_month_ago = []
    UsedMoney.all.each do |used_money|
      if (@two_month_ago.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_two_month_ago << used_money.how_much
       end
      end
    end
    @total_three_month_ago = []
    UsedMoney.all.each do |used_money|
      if (@three_month_ago.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_three_month_ago << used_money.how_much
       end
      end
    end
    @total_four_month_ago = []
    UsedMoney.all.each do |used_money|
      if (@four_month_ago.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_four_month_ago << used_money.how_much
       end
      end
    end
    @total_five_month_ago = []
    UsedMoney.all.each do |used_money|
      if (@two_month_ago.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_five_month_ago << used_money.how_much
       end
      end
    end
    @total_six_month_ago = []
    UsedMoney.all.each do |used_money|
      if (@six_month_ago.include?(Date.parse(used_money[:date].to_s)))
       if user_signed_in? && current_user.id == used_money.user_id 
        @total_six_month_ago << used_money.how_much
       end
      end
    end
  end

  private

  def used_money_params
    params.require(:used_money).permit(:date, :location, :what, :how_much, :way_id,).merge(user_id: current_user.id)
  end
end
