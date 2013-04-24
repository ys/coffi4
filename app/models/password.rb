class Password < ActiveRecord::Base
  belongs_to :place, inverse_of: :passwords
  belongs_to :user
end
