require 'rails_helper'

RSpec.describe Book, type: :model do
  it {is_expected.to belong_to(:category)}
  it {is_expected.to have_many(:reservations)}
end
