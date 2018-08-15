class FlatsController < ApplicationController
  before_action :set_flats, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @flats = Flat.where('address LIKE ?', "%#{params[:search]}%")
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    Flat.create!(flat_params)
    redirect_to flats_path
  end

  def edit
  end

  def update
    @flat.update!(flat_params)
    redirect_to flat_path(@flat.id)
  end

  def destroy
    @flat.destroy!
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flats
    @flat = Flat.find(params[:id])
  end
end
