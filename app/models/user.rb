class User < ActiveRecord::Base
  belongs_to :role

  has_role_intern = ->(user) { user.role_name == "Intern" }
  validates :name, presence: true
  validates :email, format: /@.*\./, allow_blank: true
  validates :emergency_contact_name, presence: true, if: has_role_intern
  validates :emergency_contact_phone, presence: true, if: has_role_intern
  validates :waiver_signature, presence: true, format: %r{\w/s/\Z}
  validates :photo_release, format: %r{\w/s/\Z}, allow_blank: true

  def role_name
    role && role.name
  end
end
