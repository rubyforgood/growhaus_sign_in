require 'rails_helper'

RSpec.describe "staffs/index", type: :view do
  before(:each) do
    assign(:staffs, [
      Staff.create!(
        :name => "Name",
        :email => "Email",
        :image_url => "Image Url",
        :account_url => "Account Url",
        :provider => "Provider",
        :token => "Token",
        :uid => "Uid"
      ),
      Staff.create!(
        :name => "Name",
        :email => "Email",
        :image_url => "Image Url",
        :account_url => "Account Url",
        :provider => "Provider",
        :token => "Token",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of staffs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Account Url".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
