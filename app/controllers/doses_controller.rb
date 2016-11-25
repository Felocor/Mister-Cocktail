class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = dose.cocktail
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
