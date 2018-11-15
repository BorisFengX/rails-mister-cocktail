class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
# <<<<<<< HEAD
    @ingredient = Ingredient.where(name: params[:dose][:ingredient]).first
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
# =======
    # @dose = Dose.new(description: dose_params[:description])
    # @dose.cocktail = Cocktail.find(params[:cocktail_id]) unless params[:cocktail_id].nil?
    # @dose.ingredient = Ingredient.find_by_name(dose_params[:ingredient])

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
    # params.require(:dose).permit(:description, :ingredient)
    params.require(:dose).permit(:description)
  end

end
