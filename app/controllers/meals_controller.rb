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

    if @meal.save
      day = Day.find(params[:day_id])
      day.protein += Meal.get_protein(@meal)
      if day.save
        flash.now[:notice] = "successfully increased day's protein"
      else 
        flash.now[:error] = "could not increase day's protein"
      end
        redirect_to day_path(params[:day_id])
    else
      flash.now[:error] = "Meal was not created."
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def edit
    @meal = Meal.find(params[:id])  
  end
  
  def update
    @meal = Meal.find(params[:id])
    day = Day.find(@meal.day_id)
    old_meals_protein = Meal.get_protein(@meal)
    
    @meal.grams = params[:meal][:grams]
    @meal.description = params[:meal][:description]
    @meal.food_id = params[:meal][:food_id]

    if @meal.save
      p 111111111111
      p old_meals_protein.to_i
      day.protein -= old_meals_protein
      day.protein += Meal.get_protein(@meal)
      #TODO Day#update_protein
      if day.save
        flash.now[:notice] = "successfully increased day's protein"
      else 
        flash.now[:error] = "could not increase day's protein"
      end

      flash.now[:notice] = "edit successful, protein is refreshed"
      redirect_to action: 'show'
    else
      flash.now[:error] = "could not edit the meal"
      redirect_to action: 'edit'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    day = Day.find(@meal.day_id)
    day.protein -= Meal.get_protein(@meal)
    if @meal.delete
      if day.save
        flash.now[:notice] = "successfully decreased day's protein"
      else 
        flash.now[:error] = "could decrease day's protein"
      end

      flash.now[:notice] = "The meal was deleted successfully."
      redirect_to day_path(@meal.day_id)
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