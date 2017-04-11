class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
    redirect_to ingredients_path, notice: 'Ingredient Created'
    else
    render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient Updated'
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @recipe = Recipe.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
