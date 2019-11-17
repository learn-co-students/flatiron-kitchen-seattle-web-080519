class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    get_recipe
  end

  def new
    @recipe = Recipe.new
    get_ingredients
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      puts @recipe.errors.full_messages
      render :new
    end
  end

  def edit
    get_recipe
    get_ingredients
  end

  def update
    get_recipe
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      puts @recipe.errors.full_messages
      render :edit
    end
  end

  def destroy
    get_recipe
    @recipe.destroy
    redirect_to recipes_path
  end


  private

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
  
end