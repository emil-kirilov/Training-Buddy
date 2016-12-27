class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.day_id = params[:day_id]
    #@day = Day.where(user_id: current_user)

    if @meal.save
      #@food = Food.find(@meal.food_id)
      #@day.protein= @food.protein
      p "----------"
      @day = Day.find(1)
      @day.protein += @meal.protein
      p @day.protein
      if @day.save
        p "yeeeeeeeees"
        p @day.protein
      else 
        p "nooooo"
      end

      redirect_to day_meals_path(params[:day_id])
    else
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def edit
  end
  
  def update
  end

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.delete
      flash.now[:notice] = "The meal was deleted successfully."
      redirect_to day_meals_path(@meal.day_id)
    else
      flash.now[:error] = "The meal was not deleted."
      redirect_to day_meals_path(@meal.day_id)
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:grams, :description, :food_id)
  end
end