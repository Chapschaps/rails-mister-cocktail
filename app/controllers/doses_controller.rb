class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail_id: @cocktail)
  end

  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @name_ingredients = []
    Ingredient.all.each do |ingredient|
      @name_ingredients << ingredient.name
    end
  end

  def create
    @dose = Dose.new
    @dose.description = params["dose"]["description"]
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @name_ingredients = []
    Ingredient.all.each do |ingredient|
      @name_ingredients << ingredient.name
    end
    @ingredient_param = params["dose"]["ingredient"]
    @ingredient_array = Ingredient.where(name: @ingredient_param)
    @ingredient_array.each { |ingredient| @dose.ingredient = ingredient }
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params["id"])
    @dose.delete
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
