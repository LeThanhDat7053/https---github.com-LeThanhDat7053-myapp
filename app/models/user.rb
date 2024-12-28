class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_secure_password

  # Phương thức xác thực
  def self.authenticate_by(email_address, password)
    user = find_by(email_address: email_address)
    user&.authenticate(password)
  end
end
