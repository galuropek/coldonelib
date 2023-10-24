class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find params[:id]
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new beer_params
    if @beer.save
      redirect_to beers_path
    else
      render :new
    end
  end

  def edit
    @beer = Beer.find_by id: params[:id]
  end

  private

  def beer_params
    params.require(:beer).permit(:title, :brand, :name, :description)
  end
end
