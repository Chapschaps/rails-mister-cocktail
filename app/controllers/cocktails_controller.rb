class CocktailsController < ApplicationController
  def index
    if params[:search]
      @cocktails = Cocktail.where('name like ?', "%#{params[:search]}%")
    else
    @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: @cocktail)

    # @reviews = Review.where(cocktail: @cocktail)
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
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :dose_id, :ingredient_id, :photo)
  end
end
