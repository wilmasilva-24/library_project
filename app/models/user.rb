class User < ApplicationRecord
  devise :database_authenticatable
  enum permission: {common: 0, admin: 1}
  has_many :reservations
end
