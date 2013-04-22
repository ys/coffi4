require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has one active password" do
    p = Place.new password: "password"
    assert p.password == "password"
    p.password = "test"
    assert p.password == "test"
  end

  test "keeps history of passwords" do
    p = Place.new password: "password"
    p.password = "test"
    assert p.passwords.first.value == "password"
    assert p.passwords.last.value == "test"
  end

  test "has the password update date" do
    p = Place.new name: "place", password: "password"
    p.save!
    assert p.password_updated_at
  end

  test "is geocoded" do
    p = Place.create name: "place", address: "Rue sans souci 145", city: "Ixelles", country: "Belgium"
    assert p.latitude, "has a geocoded"
    assert p.longitude, "has a geocoded"
  end

  test "can has no password" do
    p = Place.create name: "coucou"
    refute p.password
  end
end
