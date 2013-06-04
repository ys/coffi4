class PlacesController < ApplicationController

  def index
    respond_with places
  end

  def create
    place.save
    respond_with place
  end

  def show
    respond_with place
  end

  def place_params
    params.require(:place).permit(:name, :address, :city, :country, :password)
  end

  def places
    @places ||= Place.all.order('updated_at desc').limit(10).to_a
  end

  def place
    if params[:action] == 'create'
      @place = Place.new(place_params)
    else
      @place = Place.find(params[:id])
    end
  end
end
