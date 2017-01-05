class DaysController < ApplicationController
  def create
    @day = Day.new
    @day.update(day: DateTime.now.to_date, user_id: params[:user_id]) 
    if @day.save 
      redirect_to user_days_path
    else
      flash[:error] = @day.errors   
      redirect_to user_days_path
    end
  end 

  def index
    @days = Day.where(user_id: params[:user_id])
  end

  def show
    @day = Day.find(params[:id])
    @meals = Meal.meals(@day)
  end

  def destroy
    @day = Day.find(params[:id])
    if @day.delete
      flash.now[:notice] = "The day was deleted successfully."
      redirect_to user_days_path(current_user)
    else
      flash.now[:error] = "The day was not deleted."
      redirect_to user_days_path(current_user)
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    meal = Meal.find(params[:id])
    @day = Day.find(meal.day_id)
    @day.protein = days_params[:protein]
    if @day.save
      redirect_to action: 'show'
    else
      redirect_to action: 'edit'
    end
  end

  def days_params
    params.require(:day).permit(:protein)
  end
end