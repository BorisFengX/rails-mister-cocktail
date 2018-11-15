class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def filter
    # raise
    @cocktails = Cocktail.where("name LIKE '%#{params[:name]}%'")
    # ("name LIKE '#{params[:name]}'")
  end


  def show
    # @reviews = Review.where("cocktail_id": @cocktail.id)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
    # @cocktail.save
    # redirect_to cocktails_path(@cocktail)
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.delete
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
