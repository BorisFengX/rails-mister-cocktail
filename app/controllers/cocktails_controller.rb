class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cocktail_params
  end

  def find_cocktail
  end
end
