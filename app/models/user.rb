class User < ApplicationRecord
  enum permission: {common: 0, admin: 1}
end
