require 'rails_helper'

RSpec.describe "staffs/show", type: :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :name => "Name",
      :email => "Email",
      :image_url => "Image Url",
      :account_url => "Account Url",
      :provider => "Provider",
      :token => "Token",
      :uid => "Uid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/Account Url/)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Token/)
    expect(rendered).to match(/Uid/)
  end
end
