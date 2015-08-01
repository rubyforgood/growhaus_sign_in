json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :address, :address2, :city, :state, :zip_code, :emergency_contact_name, :emergency_contact_phone, :waiver_signature, :photo_release
  json.url user_url(user, format: :json)
end
