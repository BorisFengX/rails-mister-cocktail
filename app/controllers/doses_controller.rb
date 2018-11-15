class DosesController < ApplicationController

  def index
    rediect_to cocktail_path(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(description: dose_params[:description])
    @dose.cocktail = Cocktail.find(params[:cocktail_id]) unless params[:cocktail_id].nil?
    # @dose.ingredient = Ingredient.find_by_name(dose_params[:ingredient])
    @dose.ingredient = Ingredient.find(dose_params[:ingredient_id]) unless dose_params[:ingredient_id].nil?
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail.id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
