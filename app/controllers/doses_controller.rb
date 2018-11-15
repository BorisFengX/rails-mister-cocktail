class DosesController < ApplicationController

  def index
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params[:description])
    @dose.ingredient = Ingredient.where(dose_params[:ingredient])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail.id)
    else
      render :new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
