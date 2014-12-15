require "bcrypt"

class User < ActiveRecord::Base
  # attributes
  attr_accessor :password

  # callbacks
  before_save :encrypt_password

  # relationships
  has_many :plans
  belongs_to_many :groups

  # validations
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email,
    :presence => true,
    :uniqueness => { case_sensitive: false },
    :length => { maximum: 255 },
    :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # methods
  def authenticate(password)
    if BCrypt::Password.new(self.password) == password
      return self
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      return self.password = BCrypt::Password.create(password)
    end
  end

end