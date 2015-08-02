json.array!(@staffs) do |staff|
  json.extract! staff, :id, :name, :email, :image_url, :account_url, :provider, :token, :uid
  json.url staff_url(staff, format: :json)
end
