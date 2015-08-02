FactoryGirl.define do
  factory :user do
    name 'MyString'
    email 'email@example.com'
    address 'MyString'
    address2 'MyString'
    city 'MyString'
    state 'MyString'
    zip_code 'MyString'
    emergency_contact_name 'MyString'
    emergency_contact_phone 'MyString'
    waiver_signature 'Name/s/'
    photo_release 'Name/s/'
    volunteer_signature 'Name/s/'
  end
end
