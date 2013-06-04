require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module PlaceRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :name
  property :address
  property :city
  property :country
  property :password
  href {"//coucou"}
  link :self do
    place_url(self)
  end
end
