require 'rails_helper'

RSpec.describe "staffs/edit", type: :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :name => "MyString",
      :email => "MyString",
      :image_url => "MyString",
      :account_url => "MyString",
      :provider => "MyString",
      :token => "MyString",
      :uid => "MyString"
    ))
  end

  it "renders the edit staff form" do
    render

    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do

      assert_select "input#staff_name[name=?]", "staff[name]"

      assert_select "input#staff_email[name=?]", "staff[email]"

      assert_select "input#staff_image_url[name=?]", "staff[image_url]"

      assert_select "input#staff_account_url[name=?]", "staff[account_url]"

      assert_select "input#staff_provider[name=?]", "staff[provider]"

      assert_select "input#staff_token[name=?]", "staff[token]"

      assert_select "input#staff_uid[name=?]", "staff[uid]"
    end
  end
end
