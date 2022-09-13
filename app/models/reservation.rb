class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: {open: 0, closed: 1}
end
