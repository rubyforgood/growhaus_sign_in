require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'Name',
                            email: 'Email',
                            address: 'Address',
                            address2: 'Address2',
                            city: 'City',
                            state: 'State',
                            zip_code: 'Zip Code',
                            emergency_contact_name: 'Emergency Contact Name',
                            emergency_contact_phone: 'Emergency Contact Phone',
                            waiver_signature: 'Waiver Signature',
                            photo_release: 'Photo Release'
    ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Emergency Contact Name/)
    expect(rendered).to match(/Emergency Contact Phone/)
    expect(rendered).to match(/Waiver Signature/)
    expect(rendered).to match(/Photo Release/)
  end
end
