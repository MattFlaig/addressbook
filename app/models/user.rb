class User < ActiveRecord::Base
	has_secure_password
	has_many :contacts

  validates :email, format:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, uniqueness: true
  validates :username, presence: true
end
