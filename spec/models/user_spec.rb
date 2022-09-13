require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to define_enum_for(:permission).with([:common, :admin])}
  it {is_expected.to have_many(:reservations)}
end
