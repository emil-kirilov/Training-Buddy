class DaysController < ApplicationController
  def create
    @day = Day.new
    @day.update(day: DateTime.now.to_date, user_id: params[:user_id]) 
    if @day.save 
      redirect_to user_days_path
    else
      flash[:error] = "New day could not be created."
      redirect_to user_days_path
    end
  end 

  def index
    @days = Day.where(user_id: params[:user_id])
  end
end