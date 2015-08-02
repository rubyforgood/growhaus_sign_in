class User < ActiveRecord::Base
  belongs_to :role
  has_many :activity_sessions

  has_role_intern = ->(user) { user.role_name == "Intern" }
  has_role_volunteer = ->(user) { user.role_name == "Volunteer" }
  signature_format = %r{\w/s/\Z}
  signature_error_message = I18n.t('user.signature_error')
  validates :name, presence: true
  validates :email, format: /@.*\./, allow_blank: true
  validates :emergency_contact_name, presence: true, if: has_role_intern
  validates :emergency_contact_phone, presence: true, if: has_role_intern
  validates :waiver_signature, presence: true, format: {with: signature_format, message: signature_error_message}
  validates :photo_release, format: {with: signature_format, message: signature_error_message} , allow_blank: true
  validates :volunteer_signature, format: {with: signature_format, message: signature_error_message} , allow_blank: true
  validates :volunteer_signature, presence: true, if: has_role_volunteer

  before_save :touch_changed_timestamps

  def role_name
    role && role.name
  end

  def touch_changed_timestamps
    if volunteer_signature_changed? && volunteer_signature.present?
      self.volunteer_signed_at = Time.new
    end

    if waiver_signature_changed? && waiver_signature.present?
      self.waiver_signed_at = Time.new
    end

    if photo_release_changed? && photo_release.present?
      self.photo_release_signed_at = Time.new
    end
  end
end
