class PlaceSerializer < ActiveModel::Serializer
  attributes :name, :address, :city, :country,
             :fsq_id, :wifi, :latitude, :longitude, :password, :note
end
