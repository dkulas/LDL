require 'bcrypt'
require_relative '../db/connection'

class User < ActiveRecord::Base
	has_many :plans
	has_and_belongs_to_many :groups

  def encrypt_password
    if password.present?
      return self.password_digest = BCrypt::Password.create(password)
    end
  end
end