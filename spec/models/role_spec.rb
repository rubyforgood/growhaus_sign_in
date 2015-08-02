require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:valid_attributes) do
    {
      name: 'Visitor'
    }
  end

  it 'belongs_to user_type' do
    role = Role.create! valid_attributes
    User.create!(name: 'Bob',
                 role: Role.find_by(name: 'Visitor'),
                 waiver_signature: 'Bob/s/')
    expect(role.users).to eq [User.first]
  end
end
