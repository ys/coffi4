class Vote
  def self.for_wifi(user, place, note)
    note = Note.where(user_id: user.id, place_id: place.id).first_or_create value: note
  end
end
