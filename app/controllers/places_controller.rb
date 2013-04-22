class PlacesController < ApplicationController

  def index
    @places = Place.all.order('updated_at desc')#.limit(20).skip(20*(page - 1))
    render json: @places
  end

  def page
    Integer(params[:page] || 0)
  end
end
