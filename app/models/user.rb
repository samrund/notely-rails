class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }, on: :create
  validate :require_password_confirmation
  before_create :generate_api_key
  has_many :notes

  def display_name
    name.presence || username
  end

  def generate_api_key
    self.api_key = BCrypt::Password.create(password_digest)
  end

  def generate_api_key!
    generate_api_key
    save
  end

  private

  def require_password_confirmation
    if password.present? && password != password_confirmation
      errors.add :password_confirmation, 'is required when setting your password'
    end
  end
end
