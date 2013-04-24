class Place < ActiveRecord::Base
  extend FriendlyId

  belongs_to :creator, class_name: 'User'
  has_many :passwords, inverse_of: :place
  has_many :notes,     inverse_of: :place

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

  def note
    notes.to_a.sum(&:value).to_f / notes.count
  end
end
