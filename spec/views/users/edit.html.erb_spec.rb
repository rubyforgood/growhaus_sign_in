require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'MyString',
                            email: 'MyString',
                            address: 'MyString',
                            address2: 'MyString',
                            city: 'MyString',
                            state: 'MyString',
                            zip_code: 'MyString',
                            emergency_contact_name: 'MyString',
                            emergency_contact_phone: 'MyString',
                            waiver_signature: 'MyString',
                            photo_release: 'MyString'
    ))
  end

  xit 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input#user_name[name=?]', 'user[name]'

      assert_select 'input#user_email[name=?]', 'user[email]'

      assert_select 'input#user_address[name=?]', 'user[address]'

      assert_select 'input#user_address2[name=?]', 'user[address2]'

      assert_select 'input#user_city[name=?]', 'user[city]'

      assert_select 'input#user_state[name=?]', 'user[state]'

      assert_select 'input#user_zip_code[name=?]', 'user[zip_code]'

      assert_select 'input#user_emergency_contact_name[name=?]',
                    'user[emergency_contact_name]'

      assert_select 'input#user_emergency_contact_phone[name=?]',
                    'user[emergency_contact_phone]'

      assert_select 'input#user_waiver_signature[name=?]',
                    'user[waiver_signature]'

      assert_select 'input#user_photo_release[name=?]', 'user[photo_release]'
    end
  end
end
