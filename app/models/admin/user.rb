class Admin::User
  include Mongoid::Document

  field :email
  field :login
  field :password_salt
  field :password_hash

  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_presence_of :login
  validates_uniqueness_of :login
  validates_presence_of :email
  validates_uniqueness_of :email  
  validates_presence_of :password
  validates_confirmation_of :password
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,  password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
