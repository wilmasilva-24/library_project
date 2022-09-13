require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it {is_expected.to define_enum_for(:status).with([:open, :closed])}
  it {is_expected.to belong_to(:book)}
  it {is_expected.to belong_to(:user)}
end
