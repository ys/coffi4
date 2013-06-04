class VotesController < ApplicationController
  def create

  end

  def destroy

  end

  def place
    @place ||= Place.find(params[:place_id].downcase)
  end
end
