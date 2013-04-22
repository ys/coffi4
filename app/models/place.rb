class Place < ActiveRecord::Base
  extend FriendlyId
  has_many :passwords

  validates :name, presence: true

  geocoded_by :full_address
  friendly_id :name, use: :slugged

  after_validation :geocode, if: :has_address?, unless: :has_coordinates?

  def full_address
    "#{address} #{city}, #{country}"
  end

  def password
    passwords.last ? passwords.last.value : nil
  end

  def password= value
    passwords.build(value: value)
  end

  def password_updated_at
    passwords.last.created_at
  end

  def has_address?
    address.present?
  end

  def has_coordinates?
    latitude && longitude
  end
end
