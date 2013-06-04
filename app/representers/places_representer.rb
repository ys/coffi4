require 'roar/representer/json/collection_json'
require 'roar/decorator'

module PlacesRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::CollectionJSON
  version "0.1"
  href { "//coucou/" }
  link(:self){ "//"}
  items(class: Place) do
    href { "//caca"}
    link(:self){ "//dajdpa"}
    property :slug
  end
  template do
    property :slug
  end
  queries do
    link :search do
      {:href => "//search", :data => [{:name => "q", :value => ""}]}
    end
  end
end

