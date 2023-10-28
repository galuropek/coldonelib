class BeersController < ApplicationController
  before_action :load_beer, only: %i[show edit update destroy]

  def index
    @beers = Beer.order(created_at: :desc).page params[:page]
  end

  def show
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
  end

  def update
    if @beer.update(beer_params)
      redirect_to beers_path
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  private

  def load_beer
    @beer = Beer.find params[:id]
  end

  def beer_params
    params.require(:beer).permit(:title, :brand, :name, :description)
  end
end
