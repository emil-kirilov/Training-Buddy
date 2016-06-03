class FoodsController < ApplicationController 
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = params[:user_id] 
    if @food.save
      flash[:notice] = "Food created successfully."
      redirect_to user_foods_path
    else
      flash.now[:error] = "Some error occured. The food was not created."
      render :new
    end
  end

  def index
    @foods = Food.where(user: current_user)
  end

  private

  def food_params
    params.require(:food).permit(:name, :description, :energy, :fat, :protein, :carbohydrate, :fibre)
  end
end