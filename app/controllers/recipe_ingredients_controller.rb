class RecipeIngredientsController < ApplicationController
  def new
    @recipes = Recipe.all.map { |r| [r.name, r.id] }
    @ingredients = Ingredient.all.map { |i| [i.name, i.id] }
    @recipe_ingredient = RecipeIngredient.new
  end

def create
  @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    if @recipe_ingredient.save
      flash[:notice] = 'Ingredient added to recipe'
      redirect_to :back
    else
      render :new
    end
end

def destroy
  recipe_ingredient = RecipeIngredient.find(params[:id])
  recipe_ingredient.destroy
  redirect_to recipe_path(recipe_ingredient.recipe_id)
end

  private
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount)
    end
end
