class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password,
                        :password_confirmation

  after_initialize :create_key
   def create_key
     self.update(api_key: SecureRandom.hex)
   end
end
