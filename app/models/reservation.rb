class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def define_status
    if self.date_return.nil?
      "Reserva em aberto"
    else
      "Reserva finalizada"
    end
  end
end
