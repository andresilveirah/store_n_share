require 'rails_helper'

RSpec.describe User, type: :model do
  it "should require a name" do
    expect(build(:user, name: nil)).to_not be_valid
  end
end
