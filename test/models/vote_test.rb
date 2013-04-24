require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def setup
    @user = User.create
    @user1 = User.create
    @place = Place.create name: 'test'
  end

  test 'it adds a note to the place' do
    Vote.for_wifi(@user, @place, 3)
    assert Note.last.place_id == @place.id
    assert Note.last.user_id == @user.id
    assert Note.last.value == 3
    assert Note.count == 1
  end

  test 'user cannot vote twice for same place' do
    Vote.for_wifi(@user, @place, 3)
    Vote.for_wifi(@user, @place, 3)
    assert Note.count == 1
  end

  test 'after a vote, place note is adapted' do
    Vote.for_wifi(@user, @place, 3)
    assert @place.note == 3
    Vote.for_wifi(@user1, @place, 4)
    assert @place.reload.note == 3.5
  end
end

