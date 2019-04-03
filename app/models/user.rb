class User < ApplicationRecord
  has_secure_password
end
  # validates_presence_of :username, :password_digest
