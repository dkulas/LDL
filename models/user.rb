require "bcrypt"
require_relative "../db/connection"

class User < ActiveRecord::Base
  # attributes
  attr_accessor :password

  # callbacks
  before_save :encrypt_password

  # relationships
  has_and_belongs_to_many :groups
  has_many :plans

  # validations
  validates_presence_of :password, :on => :create
  validates :name,
    :presence => true,
    :length => { maximum: 255 }
  validates :email,
    :presence => true,
    :uniqueness => { case_sensitive: false },
    :length => { maximum: 255 },
    :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # methods
  def authenticate(password)
    if BCrypt::Password.new(self.password_digest) == password
      return self
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      return self.password_digest = BCrypt::Password.create(password)
    end
  end

end