class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create]
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def dose_params
  end

  def find_cocktail
  end
end
