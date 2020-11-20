class UsedMoneysController < ApplicationController
  def index
  end

  def new
    @used_money = UsedMoney.new
  end

  def create
  end
  
end
