class Staff < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    staff = Staff.find_or_create_by(provider: data.provider, uid: data.uid)

    staff.name = data.info.name
    staff.email = data.info.email
    staff.image_url = data.info.image
    staff.account_url = data.info.urls.Google
    staff.provider = data.provider
    staff.token = data.credentials.token
    staff.uid = data.uid
    staff.save

    staff
  end
end
