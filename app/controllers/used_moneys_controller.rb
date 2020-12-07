class UsedMoneysController < ApplicationController
  def index
    @used_moneys = UsedMoney.all.order(date: :desc)
    @this_month = Date.today.all_month
    @total = []
    UsedMoney.all.each do |used_money|
      next unless @this_month.include?(Date.parse(used_money[:date].to_s))

      @total << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
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
      next unless @this_month.include?(Date.parse(used_money[:date].to_s))

      @total << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_last_month = []
    UsedMoney.all.each do |used_money|
      next unless @last_month.include?(Date.parse(used_money[:date].to_s))

      @total_last_month << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_two_month_ago = []
    UsedMoney.all.each do |used_money|
      next unless @two_month_ago.include?(Date.parse(used_money[:date].to_s))

      @total_two_month_ago << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_three_month_ago = []
    UsedMoney.all.each do |used_money|
      next unless @three_month_ago.include?(Date.parse(used_money[:date].to_s))

      @total_three_month_ago << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_four_month_ago = []
    UsedMoney.all.each do |used_money|
      next unless @four_month_ago.include?(Date.parse(used_money[:date].to_s))

      @total_four_month_ago << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_five_month_ago = []
    UsedMoney.all.each do |used_money|
      next unless @two_month_ago.include?(Date.parse(used_money[:date].to_s))

      @total_five_month_ago << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
    @total_six_month_ago = []
    UsedMoney.all.each do |used_money|
      next unless @six_month_ago.include?(Date.parse(used_money[:date].to_s))

      @total_six_month_ago << used_money.how_much if user_signed_in? && current_user.id == used_money.user_id
    end
  end

  private

  def used_money_params
    params.require(:used_money).permit(:date, :location, :what, :how_much, :way_id).merge(user_id: current_user.id)
  end
end
