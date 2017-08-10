class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy]

  def index
    @doses = Dose.all
  end

  def show; end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
