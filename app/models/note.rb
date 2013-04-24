class Note < ActiveRecord::Base

  belongs_to :place, inverse_of: :notes
  belongs_to :user

  validates :user_id,  presence: true
  validates :place_id, presence: true, uniqueness: { scope: :user_id }
  validates :value, :numericality => { only_integer: true ,
                                       greater_than_or_equal: 0,
                                       less_than_or_equal_to: 5 }
end
