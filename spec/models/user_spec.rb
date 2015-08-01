require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) do
    {
      name: "Bob User",
      role: Role.find_by(name: "Visitor")
    }
  end

  it "belongs_to user_type" do
    Role.create! name: "Visitor"
    user = User.create! valid_attributes
    expect(user.role).to eq Role.first
  end
end
