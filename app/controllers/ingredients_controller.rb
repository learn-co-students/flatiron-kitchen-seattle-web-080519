class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    get_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      puts @ingredient.errors.full_messages
      render :new
    end
  end

  def edit
    get_ingredient
  end

  def update
    get_ingredient
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      puts @ingredient.errors.full_messages
      render :edit
    end
  end

  def destroy
    get_ingredient
    @ingredient.destroy
    redirect_to ingredients_path
  end


  private

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end