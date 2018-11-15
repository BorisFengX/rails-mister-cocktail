class IngredientsController < ApplicationController

  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]
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

  def ingredient_params
  end

  def find_ingredient
  end
end
