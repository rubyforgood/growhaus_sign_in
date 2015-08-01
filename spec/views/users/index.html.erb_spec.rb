require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
             :name => "Name",
             :email => "Email",
             :address => "Address",
             :address2 => "Address2",
             :city => "City",
             :state => "State",
             :zip_code => "Zip Code",
             :emergency_contact_name => "Emergency Contact Name",
             :emergency_contact_phone => "Emergency Contact Phone",
             :waiver_signature => "Waiver Signature",
             :photo_release => "Photo Release"
           ),
             User.create!(
               :name => "Name",
               :email => "Email",
               :address => "Address",
               :address2 => "Address2",
               :city => "City",
               :state => "State",
               :zip_code => "Zip Code",
               :emergency_contact_name => "Emergency Contact Name",
               :emergency_contact_phone => "Emergency Contact Phone",
               :waiver_signature => "Waiver Signature",
               :photo_release => "Photo Release"
             )
           ])
  end

  xit "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "Emergency Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Emergency Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Waiver Signature".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Release".to_s, :count => 2
  end
end
